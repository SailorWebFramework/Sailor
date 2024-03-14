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
    
    public func addBelow(_ node: any Element) {
        let aboveNode = node.renderer as! JSNode
        let parentNode = aboveNode.element.parentNode
            
        parentNode.insertBefore(self.element, aboveNode.element.nextSibling)

    }
    
    public func clearBody() {
        // TODO: this probably overrides some non-string elements...
        self.element.innerHTML = ""

    }
    
    public func clearAttributes() {
        removeAttributes()
    }
    
    public func clearEvents() {
        removeEvents()
    }
    
    public func reconcile(with newContent: any Operator) {
        guard let oldContent = SailboatGlobal.manager.managedPages.children[self.elementID] else {
            print("BRO WHAT")
            return
        }
        
        guard type(of: newContent) == type(of: oldContent) else {
            fatalError("reconciling two different node types")
        }
        
        // TODO: theoretically this should always be true so remove the else?
        if oldContent.hash == newContent.hash {
            print("hash is the same")
            reconcileBody(oldList: oldContent, newList: newContent)
            
        } else {
            print("hash is different rebuilding")

            let myElement = SailboatGlobal.manager.managedPages.elements[self.elementID]
            // TODO: also need to clear the children elements array in manager
            self.clearBody()
            self.build(page: newContent, parent: myElement)
        }

    }
    
    private func reconcileBody(oldList: any Operator, newList: any Operator, aboveElement: (any Element)? = nil) {
        guard oldList.children.count == newList.children.count else {
            fatalError("TWO OPERATORS SHOULD NOT HAVE SAME HASH AND DIFFERENT AMOUNT OF ELEMENTS")
        }

        let elementCount = oldList.children.count
        
        var last: (any Element)? = aboveElement
        
        for i in 0..<elementCount {
            
            if let oldElement = oldList.children[i] as? any Element {
                last = oldElement
            }
            
            if let oldOp = oldList.children[i] as? any Operator,
               let newOp = newList.children[i] as? any Operator {
                
                if oldOp.hash == newOp.hash {
                    print("_hash is the same")

                    reconcileBody(oldList: oldOp, newList: newOp, aboveElement: last)
                } else {
                    // rebuild
                    
                    print("SHOULD BE REMOVING INNER LIST")
                    print("_hash is different rebuilding")

//                    oldList.replace(with: newList)
//                    removeUnder()
//                    self.build(page: newOp, under: last)
                    // TODO: update the children array to the new child operator

                    // TODO: remove this replace with above
                    let myElement = SailboatGlobal.manager.managedPages.elements[self.elementID]!
                    self.clearBody()
                    self.build(page: myElement.content(), parent: myElement)
                }
            }
        }
        
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

        self.clearEvents()
        self.clearAttributes()
        self.clearBody()

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
