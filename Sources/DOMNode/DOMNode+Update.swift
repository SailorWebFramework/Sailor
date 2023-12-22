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
        
        for (eventName, _) in self.eventClosures {
            _ = self.element?.removeEventListener(eventName, eventClosures[eventName])            
        }
        
        self.eventClosures = [:]
        self.events = events
        
        for (eventName, event) in self.events {
            eventClosures[eventName] = event.getClosure()
            _ = self.element?.addEventListener(eventName, eventClosures[eventName])
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
    
//    func update(children: [any Page]) {
//        // TODO: make this more effiecient and diff the children?
//
//        // remove all old children
//        for child in self.children {
//            child.delete()
//        }
//
//        // free old children from memory
//        self.children = []
//
//        // add new children
//        for child in children {
////            child.build(parentNode: self)
//            BuildFactory.build(page: child, parentNode: self)
//        }
//    }
    
    func update(textContent: String) {
        // add content
        if case let .text(current) = self.content,
           textContent == current { return }
        
        self.element?.textContent = JSValue.string(textContent)
        
    }
    
    func update(content: TagContent) {
        switch content {
            
        case .text(let text):
            // add content
            if case let .text(current) = self.content,
               text == current { return }
            
//            self.content = .text(content)
            self.element?.textContent = JSValue.string(text)
            
        case .list(let content):
            // TODO: make this more effiecient and diff the children?

            // remove all old children
            for child in self.children {
                child.delete()
            }

            // free old children from memory
            self.children = []
            
            let newChildren = content().children
            
            // add new children
            for child in newChildren {
                BuildFactory.build(page: child, parentNode: self)
            }
                        
        }
        
        self.content = content

    }
}
