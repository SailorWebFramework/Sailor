//
//  Element.swift
//  
//
//  Created by Joshua Davis on 10/3/23.
//

public protocol Element: Page {
    
    associatedtype ElementAttributeGroup: AttributeGroup

    /// HTML tag name, all lowercased
    var name: String { get }
    
    /// attributes on HTML tag
    var attributes: [String: String] { get set }
    
    /// event names and values attached to this HTMLElement
    var events: Events { get set }
    
    /// content within HTML tags
    var content: TagContent { get set }

    /// add attribute to this Element
    func attribute(_ value: ElementAttributeGroup) -> Self
        
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
    
    func attribute(_ value: ElementAttributeGroup) -> Self {
        if attributes[value.name] == value.value { return self }

        var copy = self
        copy.attributes[value.name] = value.value
        return copy
        
    }
}
