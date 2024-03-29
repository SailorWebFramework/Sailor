//
//  Element.swift
//  
//
//  Created by Joshua Davis on 10/3/23.
//

import Foundation

public typealias ElementID = String

public protocol Element: Page, Identifiable {
    
    ///
//    static var name: String { get }

    /// Unique Element ID used to diff items
    var id: ElementID { get set }
    
    /// attributes on tag
    var attributes: [String: () -> String] { get set }
    
    /// event names and values attached to this HTMLElement
    var events: [String: (EventResult) -> Void] { get set }
    
    // TODO: dubug why (() -> any Fragment)? doesnt work
    /// content within HTML tags
    var content: () -> any Fragment { get set }
    
    /// used to render this element
    var renderer: any Renderable { get set }
        
}

public extension Element {
    var description: String {
        "Element(type: \(type(of: self)), attributes: \(self.attributes), events: \(self.events), content: \(self.content))"
    }
    
    var body: Never {
        .error()
    }

}

// TODO: make this internal? / remove?
public extension Element {
    
    func attribute(_ value: ElementAttributeGroup, override: Bool = true) -> Self {
        // TODO: dont think i can do this anymore cuz func
        //        if attributes[value.name] == value.value { return self }

        var copy = self
        
        // TODO: this logic is gross
        if override || copy.attributes[value.name] == nil {
            copy.attributes[value.name] = value.value
        } else {
            copy.attributes[value.name] = {
                copy.attributes[value.name]!() + value.value()
            }
        }
        
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
            copy.events[name] = closure
        }
        
        return copy
    }
}
