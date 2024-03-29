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
        let parentNode = asJSNode(parent)
        _ = parentNode.element.appendChild?(self.element)
        
        self.enterEvents()

    }
    
    public func insertBefore(_ deepIndex: Int, parent: any Element) {
        let parentRenderer = asJSNode(parent)
        let aboveElement = parentRenderer.element.childNodes[deepIndex]
        _ = parentRenderer.element.insertBefore?(self.element, aboveElement)
        
        self.enterEvents()
    }
    
    public func insertAfter(_ deepIndex: Int, parent: any Element) {
        let parentRenderer = asJSNode(parent)
        let aboveElement = parentRenderer.element.childNodes[deepIndex + 1]
        _ = parentRenderer.element.insertBefore?(self.element, aboveElement)
        
        self.enterEvents()

    }
    
    public func replace(with element: any Element) {
        let jsnode = asJSNode(element)

        if let parent = self.element.parentElement.object {
            _ = parent.replaceChild!(jsnode.element, self.element)
            
            // TODO: register node?
            //SailboatGlobal.managedPages.registerElement(element, operatorPage)

            // TODO: might be an issue because render Attributes dumps dependencies
//            jsnode.renderAttributes()
//            jsnode.renderEvents()
        }

        self.exitEvents()
        
        if let elementRenderer = element.renderer as? JSNode {
            elementRenderer.enterEvents()
        }
    }
    
    public func replace(at deepindex: Int, with element: any Element) {
        
        if let element = element as? any ValueElement {
            // if the element was empty then give it a child or change it
            if let obj = self.element.childNodes[deepindex].object {
                obj.textContent = JSValue.string(element.value.description)

            } else {
                fatalError("COULD NOT FIND STRING INDEX IN DOM")
            }
//            else {
//                self.element.textContent = JSValue.string(element.value.description)
//            }
            
        } else if let jsnode = element.renderer as? JSNode {
            if let parent = self.element.parentElement.object {
                _ = parent.replaceChild!(jsnode.element, self.element.childNodes[deepindex])
            }
            
            // TODO: register node?
            //SailboatGlobal.managedPages.registerElement(element, operatorPage)

            // TODO: might be an issue because render Attributes dumps dependencies
//            jsnode.renderAttributes()
//            jsnode.renderEvents()
//            jsnode.didAddToDOM()

            // TODO: need to be able to get the renderer of the child for the exit events
//            self.element.childNodes[deepindex].exitEvents()
        }
            
    }
    
    public func remove() {
        _ = self.element.remove?()
        
        // TODO: recurse over children and call their exitEvents
        // for child in children { child.renderer.remove() }
        
        exitEvents()
        
        // TODO: this doesnt work
        SailboatGlobal.managedPages.elements[self.elementID] = nil

    }
    
    public func renderAttributes() {
        guard let page = SailboatGlobal.manager.managedPages.elements[self.elementID] else {
            return
        }
        
        self.removeAttributes()

        for (key, value) in page.attributes {
            self.updateAttribute(name: key, value: value())
        }
        
        // dump the built states to the element dependency
        SailboatGlobal.manager.dumpTo(element: page)
        
        self.sailorEvents.onUpdate(.none)
    }
    
    public func renderEvents() {
        guard let page = SailboatGlobal.manager.managedPages.elements[self.elementID] else {
            return
        }
        
        // TODO: do i need this
        removeEvents()
        
        for (name, event) in page.events {
            self.addEvent(name: name, closure: event)
        }
        
    }
    
    public func remove(at deepIndex: Int) {
        let node = self.element.childNodes[deepIndex]
        
        if node == .null {
            fatalError("cannot remove at index \(deepIndex)")
        }
        
        if case let JSValue.string(idToRemove) = node.getAttribute("id") {
            SailboatGlobal.managedPages.elements[idToRemove.description]?.renderer.remove()
        } else {
            print("the node at index \(deepIndex), doesnt have id... probably stateless?")
        }
    
    }
    
    public func updateAttribute(name: String, value: String) {
        _ = self.element.setAttribute?(name, value)
        self.attributes[name] = value
        
        // on update called once the JSNode elements update
        self.sailorEvents.onUpdate(.none)
        
    }
        
}

//MARK- Helpers
extension JSNode {
    
    internal func asJSNode(_ element: any Element) -> JSNode {
        guard let element = element.renderer as? JSNode else {
            fatalError("Node should not be an Element Value, but Renderer type JSNode")
        }
                
        return element
    }
    
    
    public func enterEvents() {
        // on appear called once the JSNode becomes renderable
        self.sailorEvents.onAppear(.none)
        
        // launch tasks on the background thread on render
        // TODO: make task launch asyncronously
        self.sailorEvents.task(.none)
    }
    
    public func exitEvents() {
        
        // on disappear called once the JSNode gets removed
        self.sailorEvents.onDisappear(.none)
        
        
    }
    
}
