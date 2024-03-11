//
//  JSNode+.swift
//  
//
//  Created by Joshua Davis on 3/8/24.
//

import Sailboat
import JavaScriptKit

extension JSNode: Renderable {
    
    public func addToParent(_ parentNode: any Renderable) {
        let parentNode = parentNode as! JSNode
        
        parentNode.children.append(self)
        _ = parentNode.element.appendChild?(self.element)

        // on appear called once the JSNode becomes renderable
        self.sailorEvents.onAppear(.none)
    }
    
    // TODO: may need to remove text content if the component was a TextComponent
    // ie. self.editContent(text: "")
    public func addChild(_ child: any Renderable) {
        let child = child as! JSNode

        // add child given we are parent
        child.parent = self
        child.addToParent(self)
        
    }
    
    public func render(page: any Element) {
        // TODO: could probably shorten this logic
//        switch page.content {
//        case .text(let value):
//            // THIS IS MF UP
//            for child in self.children {
//                child.removeFromDOM()
//            }
//            
//            children = [] // TODO: should not need this
//            
//            self.editContent(text: value)
//            
//        case .list(_):
//            break
////            // Get the length of the children collection
////            let length = Int(self.element.children.length.number ?? 0)
////
////            if length == 0 {
////                self.editContent(text: "")
////            }
//        
//        }
        
        // TODO: diff events and attributes?
        // make sure order is the same for attributes

//        self.removeEvents()
        
        if self.events.isEmpty && self.sailorEvents.isEmpty {
            for (name, event) in page.events {
                self.addEvent(name: name, closure: event)
            }
        }

        if page.attributes != self.attributes {
            self.removeAttributes()

            for (key, value) in page.attributes {
                self.updateAttribute(name: key, value: value)
            }
        }
        

        // on update called once the JSNode elements update
        self.sailorEvents.onUpdate(.none)
        
        // launch tasks on the background thread on render
        // TODO: make task launch asyncronously
        self.sailorEvents.task(.none)
    }
    
    public func remove() {
//        _ = self.element.remove?()
        self.removeFromDOM()

        // on disappear called once the JSNode gets removed
        self.sailorEvents.onDisappear(.none)
    }
    
    public func replace(with renderable: any Renderable) {
        let jsnode = renderable as! JSNode

        if let parent = self.element.parentElement.object {
            _ = parent.replaceChild!(jsnode.element, self.element)
        }

        self.sailorEvents.onDisappear(.none)

    }
    
    public func updateAttribute(name: String, value: String) {
        _ = self.element.setAttribute?(name, value)
        self.attributes[name] = value
        
        // on update called once the JSNode elements update
        self.sailorEvents.onUpdate(.none)
        
    }
    
    public func debugPrint() { self.printNode() }
    
}
