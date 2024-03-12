//
//  JSNode+.swift
//  
//
//  Created by Joshua Davis on 3/8/24.
//

import Sailboat
import JavaScriptKit
import Foundation

extension JSNode: Renderable {
    
    public func addToParent(_ parent: any Element) {
        let parentNode = parent.renderer as! JSNode
        
//        parentNode.children.append(self)
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

        print("HELLLOOO")

        guard let page = SailboatGlobal.manager.managedPages.elements[self.elementID] else {
            print("page is none")
            return
        }
        
//        print("page isnt none \(page)")

        
        // TODO: diff events and attributes?
        // make sure order is the same for attributes

        self.removeEvents()
        
        if self.events.isEmpty && self.sailorEvents.isEmpty {
            for (name, event) in page.events {
//                print("\(name), \(event)")
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
    }
    
    public func remove() {

//        self.parent?.children.removeAll(where: { $0 === self })

//        removeEvents()
//        removeAttributes()
        
//        self.children = []
        
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

    }
    
    public func updateAttribute(name: String, value: String) {
        _ = self.element.setAttribute?(name, value)
        self.attributes[name] = value
        
        // on update called once the JSNode elements update
        self.sailorEvents.onUpdate(.none)
        
    }
    
    public func debugPrint() { self.printNode() }
    
}
