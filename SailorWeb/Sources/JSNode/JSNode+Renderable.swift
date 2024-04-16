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
    
    public func addToParent(_ parent: any Renderable) {
        let parentNode = asJSNode(parent)
        _ = parentNode.element.appendChild?(self.element)
        
        Self.shallowEnterEvents(on: self.element)
    }
    
    public func insertBefore(_ deepIndex: Int, parent: any Renderable) {
        let parentRenderer = asJSNode(parent)
        let aboveElement = parentRenderer.element.childNodes[deepIndex]
        _ = parentRenderer.element.insertBefore?(self.element, aboveElement)
        
        Self.shallowEnterEvents(on: self.element)
    }
    
    public func insertAfter(_ deepIndex: Int, parent: any Renderable) {
        let parentRenderer = asJSNode(parent)
        let aboveElement = parentRenderer.element.childNodes[deepIndex + 1]
        _ = parentRenderer.element.insertBefore?(self.element, aboveElement)
        
        Self.shallowEnterEvents(on: self.element)
    }
    
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
                // TODO: forcing this
                remove(node: self.element.childNodes[deepindex].object!, fromDOM: false)
                _ = parent.replaceChild!(jsnode.element, self.element.childNodes[deepindex])
            }
        }
    }
    
    public func remove() {
        remove(node: self.element)
    }

    public func remove(at deepIndex: Int) {
        guard let node = self.element.childNodes[deepIndex].object else {
            fatalError("cannot remove an object that doesnt exist")
        }

        remove(node: node)

    }

    public func addEvent(name: String, value: @escaping (EventResult) -> Void) {
        let jsClosure = EventResult.getClosure(name, action: value)
//        self.events[name] = jsClosure
        
        _ = self.element.addEventListener?(name, jsClosure)
    }

    public func updateAttribute(name: String, value: any AttributeValue) {
        _ = self.element.setAttribute?(name, value.description)
//        self.attributes[name] = value
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
    
    internal func remove(node: JSObject, fromDOM: Bool = true) {
        Self.deeplyLaunchEvents(from: node) { currentNode in
            Self.shallowExitEvents(on: currentNode)
            if let sailboatID = currentNode.getAttribute?("data-sid").string {
                RenderableUtils.removeCache(with: sailboatID)
            }
        }
        
        if fromDOM {
            _ = node.remove?()
        }
    }
    
    public func enterEvents() {
        Self.enterEvents(on: self.element)
    }
    
    public static func enterEvents(on object: JSObject) {
        // TODO: make task launch asyncronously
        deeplyLaunchEvents(from: object) { object in
            shallowEnterEvents(on: object)
        }
    }
    
    public static func shallowEnterEvents(on object: JSObject) {
        /// Set properties on the eventInit object
        callEvent(named: "_appear", on: object)
        callEvent(named: "_task", on: object)
    }
    
    public static func shallowExitEvents(on object: JSObject) {
        /// Set properties on the eventInit object
        callEvent(named: "_disappear", on: object)

    }
    
//    public static func exitEvents(on object: JSObject) {
//        /// Set properties on the eventInit object
//        deeplyLaunchEvents(from: object) { object in
//            callEvent(named: "_disappear", on: object)
//        }
//    }
    
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
    
}
