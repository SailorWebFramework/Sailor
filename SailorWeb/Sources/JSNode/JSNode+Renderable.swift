//
//  JSNode+.swift
//  
//
//  Created by Joshua Davis on 3/8/24.
//

import Sailboat
import JavaScriptKit

extension JSNode: Renderable {
//    public func addAfter(_ index: Int, parent: any Element) {
//        // TODO: add this node below the index
////        let aboveNode = node.renderer as! JSNode
////        let parentNode = aboveNode.element.parentNode
////        
////        guard !parentNode.isNull else {
////            fatalError("JSNODE: add below trying to add to node without a parent")
////        }
////
////        _ = parentNode.insertBefore(self.element, aboveNode.element.nextSibling)
//
//    }
    
    private func asJSNode(_ element: any Element) -> JSNode {
        guard let element = element.renderer as? JSNode else {
            fatalError("Node should not be an Element Value, but Renderer type JSNode")
        }
        
        return element
    }
    
    public func addBelow(_ deepIndex: Int, parent: any Element) {
        let parentRenderer = asJSNode(parent)
        
        print("attempting to add below")
        print("\(self)")
        print("at: \(deepIndex)")

        print("to: \(parent)")

        let aboveElement = parentRenderer.element.childNodes[deepIndex]
        
        _ = parentRenderer.element.insertBefore?(self.element, aboveElement)
        print("after...")

    }
    
    
    public func addToParent(_ parent: any Element) {
        let parentNode = asJSNode(parent)

        _ = parentNode.element.appendChild?(self.element)

        // on appear called once the JSNode becomes renderable
        self.sailorEvents.onAppear(.none)
        
        // launch tasks on the background thread on render
        // TODO: make task launch asyncronously
        self.sailorEvents.task(.none)
    }
    
//    public func addAbove(_ node: any Element) {
//        let belowNode = asJSNode(node)
//
//        let parentNode = belowNode.element.parentNode
//            
//        _ = parentNode.insertBefore(self.element, belowNode.element)
//
//    }
    
    public func clearBody() {
        // TODO: this probably overrides some non-string elements...
        self.element.innerHTML = ""

    }
    
    // TODO: remove these?
    public func clearAttributes() { removeAttributes() }
    
    public func clearEvents() { removeEvents() }
    
    private func addChild(_ child: any Element, below: (any Element)?) { }
    
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

//        self.clearEvents()
//        self.clearAttributes()
//        self.clearBody()

        // on disappear called once the JSNode gets removed
        self.sailorEvents.onDisappear(.none)
        
        // TODO: should this be before onDisappear?
        SailboatGlobal.manager.managedPages.elements[self.elementID] = nil

    }
    
    public func replace(with element: any Element) {
        let jsnode = asJSNode(element)

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
    
    public func replace(at index: Int, with element: any Element) {
//        var children = self.element.childNodes

        // TODO: this doesnt quite work, because of conditional lists
        if let element = element as? any ValueElement {
            print("Element thing at \(index)")
            print("Element thing at \(index)")
            
            print(self.element.childNodes[index].nodeType.number!);
            self.element.childNodes[index].object!.textContent = JSValue.string(element.value.description)
            
        } else if let jsnode = element.renderer as? JSNode {
            
            if let parent = self.element.parentElement.object {
                _ = parent.replaceChild!(jsnode.element, self.element.childNodes[index])
            }
        }
        

//        // Loop over the child nodes
//        for i in 0..<Int(length) {
//            // Access each child node
//            let node = children[i]
//
//            // Check the nodeType
//            let nodeType = node.nodeType.number!
//        }
            
    }
    
    public func updateAttribute(name: String, value: String) {
        _ = self.element.setAttribute?(name, value)
        self.attributes[name] = value
        
        // on update called once the JSNode elements update
        self.sailorEvents.onUpdate(.none)
        
    }
        
}
