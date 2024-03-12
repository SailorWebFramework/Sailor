//
//  JSNode+.swift
//  
//
//  Created by Joshua Davis on 3/8/24.
//

import Sailboat
import JavaScriptKit

extension JSNode: Renderable {
    
    public func addToParent(_ parent: any Element) {
        let parentNode = parent.renderer as! JSNode
        
        _ = parentNode.element.appendChild?(self.element)

        // on appear called once the JSNode becomes renderable
        self.sailorEvents.onAppear(.none)
        
        // launch tasks on the background thread on render
        // TODO: make task launch asyncronously
        self.sailorEvents.task(.none)
    }
    
    public func clear() {
        removeEvents()
        removeAttributes()
        
        // TODO: this probably overrides some non-string elements...
        self.element.innerHTML = ""

    }

    public func render() {
        guard let page = SailboatGlobal.manager.managedPages.elements[self.elementID] else {
            return
        }
        
        // TODO: Think events should never have to be readded?
        //self.removeEvents()
        if self.events.isEmpty && self.sailorEvents.isEmpty {
            for (name, event) in page.events {
                self.addEvent(name: name, closure: event)
            }
        }

        // TODO: diff events and attributes?
        // make sure order is the same for attributes
        if page.attributes != self.attributes {
            self.removeAttributes()

            for (key, value) in page.attributes {
                self.updateAttribute(name: key, value: value)
            }
        }

        // on update called once the JSNode elements update
        self.sailorEvents.onUpdate(.none)
    }
    
    public func remove() {

        _ = self.element.remove?()

        self.clear()


        // on disappear called once the JSNode gets removed
        self.sailorEvents.onDisappear(.none)
        
        // TODO: should this be before onDisappear?
        SailboatGlobal.manager.managedPages.elements[self.elementID] = nil

    }
    
    public func replace(with element: any Element) {
        let jsnode = element.renderer as! JSNode

        if let parent = self.element.parentElement.object {
            _ = parent.replaceChild!(jsnode.element, self.element)
        }

        self.sailorEvents.onDisappear(.none)
        
        // TODO: do this for the parent renderer
        // on appear called once the JSNode becomes renderable
//        parentRenderer.sailorEvents.onAppear(.none)
        
        // launch tasks on the background thread on render
        // TODO: make task launch asyncronously
//        parentRenderer.sailorEvents.task(.none)

    }
    
    public func updateAttribute(name: String, value: String) {
        _ = self.element.setAttribute?(name, value)
        self.attributes[name] = value
        
        // on update called once the JSNode elements update
        self.sailorEvents.onUpdate(.none)
        
    }
    
    public func debugPrint() { self.printNode() }
    
}
