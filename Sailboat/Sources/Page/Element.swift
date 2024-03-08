//
//  Element.swift
//  
//
//  Created by Joshua Davis on 10/3/23.
//

import Foundation

public protocol Renderable {
//    associatedtype Node

    func addToParent(_ parentNode: any Renderable)

    func addChild(_ childNode: any Renderable)

    func remove()
    
    func replace(with renderable: any Renderable)
    
    func addAttribute(name: String, value: String)

    func addEvent(name: String, closure: @escaping (EventResult) -> Void)
    
//    func update(attributes: [String: String])
    
//    func render()
    
//    func onAppear()
//
//    func onDisappear()
//
//    func onUpdate()

}

public typealias ElementID = String

public protocol Element: Page, Identifiable {
    
//    associatedtype ElementAttributeGroup: AttributeGroup
    associatedtype Renderer: Renderable

    /// HTML tag name, all lowercased
    var name: String { get }
    
    ///
    var id: ElementID { get set }
    
    /// attributes on tag
    var attributes: [String: String] { get set }
    
    /// event names and values attached to this HTMLElement
    var events: [String: (EventResult) -> Void] { get set }
    
    /// content within HTML tags
    var content: TagContent { get set }
    
    /// used to render this element
    var renderer: Renderer { get set }
        
}

public extension Element {
    var description: String {
        "Element(type: \(type(of: self)), attributes: \(self.attributes), events: \(self.events), content: \(self.content))"
    }
    
    var body: some Page {
        InternalError.recursingInPageBody(name: self.name)
        return self
    }

}

public struct ElementAttributeGroup: AttributeGroup {

    
    public var name: String
    public var value: String
    public var override: Bool
    
    public init(name: String, value: String) {
        self.name = name
        self.value = value
        self.override = true
    }
    public init(name: String, value: String, override: Bool) {
        self.name = name
        self.value = value
        self.override = override
    }
}

// TODO: make this internal? / remove?
public extension Element {
    
    // todo: doesnt work keeps regenerating
//    static var elementID: UUID { UUID() }
    
    func attribute(_ value: ElementAttributeGroup, override: Bool = true) -> Self {
        if attributes[value.name] == value.value { return self }

        var copy = self
        
        // TODO: this logic is gross
        if override || copy.attributes[value.name] == nil {
            copy.attributes[value.name] = value.value
        } else {
            copy.attributes[value.name]! += value.value
        }
        
        return copy
        
    }
}
