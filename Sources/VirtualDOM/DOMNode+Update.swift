//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/16/23.
//

import Foundation
import JavaScriptKit

extension DOMNode {
    
    func update(events: Events) {
        
        for (eventName, jsclosure) in self.events {
            _ = self.element?.removeEventListener(eventName, jsclosure)
        }
        
        self.events = events
        
        for (eventName, jsclosure) in self.events {
            _ = self.element?.addEventListener(eventName, jsclosure)
        }
        
    }
    
    func update(attributes: Attributes) {
        // TODO: make this more effieciet and diff the attributes
        
        // remove old attributes
        for (name, _) in self.attributes {
            _ = self.element?.removeAttribute(name.description)
        }
        
        // add new attributes
        self.attributes = attributes
        
        for (name, value) in self.attributes {
            _ = self.element?.setAttribute(name.description, value.description)
        }
    }
    
    func update(children: [any Page]) {
        // TODO: make this more effiecient and diff the children?

        // remove all old children
        for child in self.children {
            child.remove()
        }

        // free old children from memory
        self.children = []

        // add new children
        for child in children {
            child.build(parentNode: self)
        }
    }
    
    func update(content: String) {
        // add content
        if self.content == content {
            return
        }
        
        self.content = content
        self.element?.textContent = JSValue.string(self.content)
        
    }
}
