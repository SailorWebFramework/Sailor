//
//  JSNode+.swift
//  
//
//  Created by Joshua Davis on 3/8/24.
//

import Sailboat
import JavaScriptKit

extension JSNode: Renderable {
    
    private func asJSNode(_ element: any Element) -> JSNode {
        guard let element = element.renderer as? JSNode else {
            fatalError("Node should not be an Element Value, but Renderer type JSNode")
        }
                
        return element
    }
    
    private func didAddToDOM() {
        print("DID ADD TO DOM?")
        // on appear called once the JSNode becomes renderable
        self.sailorEvents.onAppear(.none)
        
        // launch tasks on the background thread on render
        // TODO: make task launch asyncronously
        self.sailorEvents.task(.none)
    }
    
    public func insertBefore(_ deepIndex: Int, parent: any Element) {
        let parentRenderer = asJSNode(parent)
        let aboveElement = parentRenderer.element.childNodes[deepIndex]
        
        _ = parentRenderer.element.insertBefore?(self.element, aboveElement)
        
        didAddToDOM()
    }
    
    public func insertAfter(_ deepIndex: Int, parent: any Element) {
        let parentRenderer = asJSNode(parent)
        let aboveElement = parentRenderer.element.childNodes[deepIndex + 1]

        _ = parentRenderer.element.insertBefore?(self.element, aboveElement)
        
        didAddToDOM()

    }
    
    public func addToParent(_ parent: any Element) {
        let parentNode = asJSNode(parent)

        _ = parentNode.element.appendChild?(self.element)
        
//        _ = JSNode.body.appendChild?(self.element)

        didAddToDOM()

    }
    
    public func clearBody() {
        // TODO: this probably overrides some non-string elements...
        // TODO: somehow need to call remove on all inner elements
        self.element.innerHTML = ""
    }
    
    // TODO: remove these?
    public func clearAttributes() { removeAttributes() }
    
    public func clearEvents() { removeEvents() }
    
//    private func addChild(_ child: any Element, below: (any Element)?) { }
    
    // TODO: consider renaming
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
        // make sure order is the same for attributes, does this actually help in speed?
        self.removeAttributes()

        for (key, value) in page.attributes {
            self.updateAttribute(name: key, value: value())
        }

        // on update called once the JSNode elements update
        self.sailorEvents.onUpdate(.none)
    }
    
    public func remove() {
        _ = self.element.remove?()

//        self.clearEvents()
//        self.clearAttributes()
//        self.clearBody()

        // on disappear called once the JSNode gets removed
        self.sailorEvents.onDisappear(.none)
        
        // TODO: should this be before onDisappear?
        SailboatGlobal.manager.managedPages.elements[self.elementID] = nil

    }
    
    public func remove(at deepIndex: Int) {
        let node = self.element.childNodes[deepIndex]
        
        if node == .null {
            fatalError("cannot remove at index \(deepIndex)")
        }
        
        if case let JSValue.string(idToRemove) = node.getAttribute("id") {
            print("removing \(idToRemove.description)")
            SailboatGlobal.managedPages.elements[idToRemove.description]?.renderer.remove()
        } else {
            print("the node at index \(deepIndex), doesnt have id... probably stateless?")
        }
    
    }
    
    public func replace(with element: any Element) {
        let jsnode = asJSNode(element)

        if let parent = self.element.parentElement.object {
            _ = parent.replaceChild!(jsnode.element, self.element)
        }

        self.sailorEvents.onDisappear(.none)
        
        if let elementRenderer = element.renderer as? JSNode {
            elementRenderer.sailorEvents.onAppear(.none)
            elementRenderer.sailorEvents.task(.none)
        }
    }
    
    public func replace(at deepindex: Int, with element: any Element) {
        
        if let element = element as? any ValueElement {
            self.element.childNodes[deepindex].object!.textContent = JSValue.string(element.value.description)
            
        } else if let jsnode = element.renderer as? JSNode {
            if let parent = self.element.parentElement.object {
                _ = parent.replaceChild!(jsnode.element, self.element.childNodes[deepindex])
            }
        }
            
    }
    
    public func updateAttribute(name: String, value: String) {
        _ = self.element.setAttribute?(name, value)
        self.attributes[name] = value
        
        // on update called once the JSNode elements update
        self.sailorEvents.onUpdate(.none)
        
    }
        
}
