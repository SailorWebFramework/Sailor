//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/24/23.
//

import Foundation
import JavaScriptKit

import Sailboat

extension HTMLNode {
    
    internal func build(attributes: Attributes) {
        for (key, value) in attributes {
            _ = self.element?.setAttribute?(key.description, value.description)
        }
    }
    
    internal func build(events: Events) {
        for (name, event) in events {
            let closure = event.getClosure()
            self.events[name] = closure
            _ = self.element?.addEventListener?(name, closure)
        }
    }
    
    internal func build(textContent: String) {
        self.element?.textContent = JSValue.string(textContent)
    }
    
    internal func update(attributes: Attributes) {
        // TODO: make this more effieciet and diff the attributes

        // remove old attributes
        for (name, _) in self.attributes {
            _ = self.element?.removeAttribute?(name.description)
        }

        // add new attributes
        self.attributes = attributes

        build(attributes: attributes)
    }
    
    internal func update(events: Events) {
        
        // remove old events
        for (name, closure) in self.events {
            _ = self.element?.removeEventListener?(name, closure)
        }

        self.events = [:]
        
        build(events: events)

    }
    
    internal func compareAttributes(to page: any HTMLElement) -> Bool {
        return self.attributes == page.attributes
    }
    
    // TODO: get compare events working properly??
    internal func compareEvents(to page: any HTMLElement) -> Bool {
        return page.events.keys == (self.page as? any HTMLElement)?.events.keys
    }
    
    internal func compareTextContent(to newText: String) -> Bool {
        guard case let .text(curText) = self.content else { return false }

        return newText == curText
    }
}
