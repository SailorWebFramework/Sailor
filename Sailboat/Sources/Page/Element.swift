//
//  Element.swift
//  
//
//  Created by Joshua Davis on 10/3/23.
//

public protocol Element: Page {
    /// attributes on tag
    var attributes: [String: () -> any AttributeValue] { get set }
    
    /// event names and values attached to this HTMLElement
    var events: [String: (EventResult) -> Void] { get set }
    
    // TODO: dubug why (() -> any Fragment)? doesnt work, swiftWASM error?
    /// content within HTML tags
    var content: () -> any Fragment { get set }
    
    /// used to render this element
    var renderer: any Renderable { get set }
        
}

public extension Element {
    var description: String {
        "Element(type: \(type(of: self)), attributes: \(self.attributes), events: \(self.events), content: \(self.content))"
    }
}

// TODO: make this internal? / remove?
public extension Element {
    
    // TODO: remove ovveride? remove this func?
    func attribute(_ value: ElementAttributeGroup, override: Bool = true) -> Self {
        // TODO: dont think i can do this anymore cuz func, or add back addding properties
        
        var copy = self
        
        copy.attributes[value.name] = value.value
        return copy
        
    }
    
    func withEvent(name: String, _ closure: @escaping (EventResult) -> Void) -> Self {
        var copy = self
        
        if let oldEvent = copy.events[name] {
            copy.events[name] = { value in
                oldEvent(value)
                closure(value)
            }
        } else {
            copy.events[name] = { value in
                closure(value)
            }
        }
        
        return copy
    }

}
