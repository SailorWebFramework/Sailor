//
//  JSNode+.swift
//  
//
//  Created by Joshua Davis on 3/8/24.
//

import Sailboat
import SailorShared
import JavaScriptKit

extension JSNode: Renderable {
        
    public func addToParent(_ parent: any Element) {
        let parentNode = asJSNode(parent.renderer)
        _ = parentNode.element.appendChild?(self.element)
        
        JSNode.enterEvents(on: self.element)
    }
    
    public func insertBefore(_ deepIndex: Int, parent: any Renderable) {
        let parentRenderer = asJSNode(parent)
        let aboveElement = parentRenderer.element.childNodes[deepIndex]
        _ = parentRenderer.element.insertBefore?(self.element, aboveElement)
        
        JSNode.enterEvents(on: self.element)
    }
    
    public func insertAfter(_ deepIndex: Int, parent: any Renderable) {
        let parentRenderer = asJSNode(parent)
        let aboveElement = parentRenderer.element.childNodes[deepIndex + 1]
        _ = parentRenderer.element.insertBefore?(self.element, aboveElement)
        
        JSNode.enterEvents(on: self.element)
    }
    
//    public func replace(with renderer: any Renderable) {
//        let jsnode = asJSNode(renderer)
//
//        Self.exitEvents(on: self.element)
//
//        if let parent = self.element.parentElement.object {
//            _ = parent.replaceChild!(jsnode.element, self.element)
//            
//            // TODO: dump dependencies? might be an issue because render Attributes dumps dependencies
////            jsnode.renderAttributes()
////            jsnode.renderEvents()
//        }
//        
//        JSNode.enterEvents(on: jsnode.element)
//    }
    
    public func replace(at deepindex: Int, with renderer: any Renderable) {
        if let stringRenderer = renderer as? StringRenderer {
            // if the element was empty then give it a child or change it
            if let obj = self.element.childNodes[deepindex].object {
                obj.textContent = JSValue.string(stringRenderer.value)

            } else {
                fatalError("COULD NOT FIND STRING INDEX IN DOM")
            }

        } else if let jsnode = renderer as? JSNode {
            
            if let parent = self.element.parentElement.object {
                _ = parent.replaceChild!(jsnode.element, self.element.childNodes[deepindex])
            }
            
            // TODO: register? call the remove method somehow? call the events? remove from elements map
//                        SailboatGlobal.managedPages.elements[self.elementID] = nil
//            SailboatGlobal.managedPages.registerElement(element, operatorPage)
//              self.element.childNodes[deepindex].exitEvents()
        }
            
    }
    
    public func remove() {
        
        // TODO: recurse over children and call their exitEvents
        // for child in children { child.renderer.remove() }
        
        JSNode.exitEvents(on: self.element)
        
        _ = self.element.remove?()

        // TODO: this doesnt work
//        SailboatGlobal.managedPages.elements[self.elementID] = nil

    }
    
    public func remove(at deepIndex: Int) {
        guard let node = self.element.childNodes[deepIndex].object else {
            fatalError("cannot remove an object that doesnt exist")
        }

        JSNode.exitEvents(on: node)

        _ = node.remove?()
        
        // TODO: call the normal remove() function using the sailor id from the dom
        
//        print("removing with id: \(node.id)")
//        SailboatGlobal.managedPages.elements[node.id.description]?.renderer.remove()
        
        //
            
//        if case let JSValue.string(idToRemove) = node.getAttribute("id") {
//            print("node being removed")
//            print("des: \(node.description)")
//
//        } else {
//            print("the node at index \(deepIndex), doesnt have id... probably stateless?")
//        }
    
    }
    
    public func addEvent(name: String, value: @escaping (EventResult) -> Void) {
        let jsClosure = EventResult.getClosure(name, action: value)
        self.events[name] = jsClosure
        
        _ = self.element.addEventListener?(name, jsClosure)
    }

    public func updateAttribute(name: String, value: any AttributeValue) {
        _ = self.element.setAttribute?(name, value.description)
        self.attributes[name] = value
    }
    
    public func setSailboatID(_ value: SailboatID?) {
        self.sid = value
        
        // TODO: what if this is false?
        if let sid = self.sid {
            self.updateAttribute(name: "data-sid", value: sid)
        }
    }
        
}

//MARK- Helpers
extension JSNode {
    
    internal func asJSNode(_ renderer: any Renderable) -> JSNode {
        guard let element = renderer as? JSNode else {
            fatalError("Node should not be an Element Value, but Renderer type JSNode")
        }
                
        return element
    }
    
    
    public func enterEvents() {
        JSNode.enterEvents(on: self.element)
    }
    
    public static func enterEvents(on object: JSObject) {
//        // on appear called once the JSNode becomes renderable
//        self.sailorEvents.onAppear(.none)
//        
//        // launch tasks on the background thread on render
//        // TODO: make task launch asyncronously
//        self.sailorEvents.task(.none)
        deeplyLaunchEvents(from: object) { object in
            callEvent(named: "_appear", on: object)
            callEvent(named: "_task", on: object)
        }

    }
    
    public static func exitEvents(on object: JSObject) {
        
        // on disappear called once the JSNode gets removed
//        self.sailorEvents.onDisappear(.none)
                
        /// Set properties on the eventInit object
        deeplyLaunchEvents(from: object) { object in
            callEvent(named: "_disappear", on: object)
        }
        
    }
    
}
