//
//  Element.swift
//  
//
//  Created by Joshua Davis on 10/3/23.
//


public protocol Renderable {
    func render()
    
    func remove()
    
    func replace(with renderable: any Renderable)
    
    func update(attributes: [String: String])
    
    func addAttribute(name: String, value: String)

    func addEvent(name: String, value: (EventResult) -> Void)
    
    func onAppear()
    
    func onDisappear()
    
    func onUpdate()

}

public protocol Element: Page {
    
    associatedtype ElementAttributeGroup: AttributeGroup

    /// HTML tag name, all lowercased
    var name: String { get }
    
    /// attributes on HTML tag
    var attributes: [String: String] { get set }
    
    /// event names and values attached to this HTMLElement
    var events: [String: (EventResult) -> Void] { get set }
    
    /// content within HTML tags
    var content: TagContent { get set }
    
    /// used to render this element
    var renderer: any Renderable { get set }
        
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
// TODO: make this internal? / remove?
public extension Element {
    
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
