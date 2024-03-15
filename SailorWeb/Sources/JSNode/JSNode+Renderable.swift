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
        
        guard !parentNode.isNull else {
            fatalError("JSNODE: add below trying to add to node without a parent")
        }

        _ = parentNode.insertBefore(self.element, aboveNode.element.nextSibling)

    }
    
    public func addAbove(_ node: any Element) {
        let belowNode = node.renderer as! JSNode
        let parentNode = belowNode.element.parentNode
            
        _ = parentNode.insertBefore(self.element, belowNode.element)

    }
    
    public func clearBody() {
        // TODO: this probably overrides some non-string elements...
        self.element.innerHTML = ""

    }
    
    public func clearAttributes() { removeAttributes() }
    
    public func clearEvents() { removeEvents() }
    
    public func reconcile(with newContent: any Operator) {
        guard let oldContent = SailboatGlobal.manager.managedPages.children[self.elementID] else {
            return
        }
        
        guard type(of: newContent) == type(of: oldContent) else {
            fatalError("reconciling two different node types")
        }
        
        var copyOfNewContent = newContent
        reconcileBody(oldList: oldContent, newList: &copyOfNewContent, aboveElement: nil, newContent: newContent)
        
        //ISSUE
        SailboatGlobal.manager.managedPages.children[self.elementID] = copyOfNewContent

//        // TODO: theoretically this should always be true so remove the else?
//        if oldContent.hash == newContent.hash {
//            print("hash is the same")
//            reconcileBody(oldList: oldContent, newList: newContent, aboveElement: nil, newContent: newContent)
//            
//        } else {
//            print("hash is different rebuilding")
//
//            let myElement = SailboatGlobal.manager.managedPages.elements[self.elementID]
//            // TODO: also need to clear the children elements array in manager
//            self.clearBody()
//            self.build(page: newContent, parent: myElement)
//        }

    }
    
    private func reconcileBody(oldList: any Operator, newList: inout any Operator, aboveElement: (any Element)? = nil, newContent: any Operator) {
        guard oldList.children.count == newList.children.count else {
            fatalError("TWO OPERATORS SHOULD NOT HAVE SAME HASH AND DIFFERENT AMOUNT OF ELEMENTS")
        }

        let elementCount = oldList.children.count
        
        var last: (any Element)? = aboveElement
        
        for i in 0..<elementCount {
            if let oldElement = oldList.children[i] as? any Element {
                last = oldElement
                
                newList.children[i] = oldList.children[i]
            }
            
            if let oldOp = oldList.children[i] as? any Operator,
               var newOp = newList.children[i] as? any Operator {
                
                print(oldOp.hash, "==", newOp.hash, "?")
                
                if oldOp.hash == newOp.hash {
                    reconcileBody(oldList: oldOp, newList: &newOp, aboveElement: last, newContent: newContent)
                    
                } else {
                    self.clearChildren(from: oldOp, aboveElement: last)
                    self.build(newOp, under: last)
                    
                }
                
                newList.children[i] = newOp
            }
        }
    }
    
    private func addChild(_ child: any Element, below: (any Element)?) { }
    
    private func build(_ newContent: any Operator, under aboveElement: (any Element)?) {
        var above = aboveElement
        for child in newContent.children {
            if let child = child as? any Element {
                if let above = above {
                    print("adding element below...")
                    print("\(above)")
                    child.renderer.build(page: child, parent: nil)
                    child.renderer.addBelow(above)
                    
                } else {
                    print("adding element at root...")
                    print("\(above)")
                    
                    if let myElement = SailboatGlobal.manager.managedPages.elements[self.elementID] {
                        child.renderer.build(page: child, parent: nil)
                        child.renderer.addToParent(myElement)
                        
                    } else {
                        fatalError("element doesnt exist in global state")
                    }
                
                }
                
                above = child
                continue
            }
            
            if let child = child as? any Operator {
                build(child, under: above)
                continue
            }
            
            // TODO: custom nodes
        }
    }
    
    private func clearChildren(from content: any Operator, aboveElement: (any Element)?) {
        for child in content.children {
            
            if let child = child as? any Element {
                child.renderer.remove()
                return
            }
            
            if let child = child as? any Operator {
                clearChildren(from: child, aboveElement: aboveElement)
                return
            }
            
            
            // TODO:
            // Problem.. what happens to custom pages the elements arent loaded
            // remove the element when rendered.
            // Custom node must neccisarily have one child
            // child.body

        }
    }
    
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

//        self.clearEvents()
//        self.clearAttributes()
//        self.clearBody()

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
    
//    public func debugPrint() { self.printNode() }
    
}
