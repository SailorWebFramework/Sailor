//
//  File.swift
//  
//
//  Created by Joshua Davis on 1/1/24.
//

import JavaScriptKit
import Sailboat

final class JSNode {

    internal var element: JSObject
//    internal var children: [JSNode]
    
    internal var elementID: ElementID

    internal var events: [String: JSClosure] // Events
    internal var sailorEvents: SailorEvents = .init()
    
    internal var attributes: JSAttributes
    
//    internal weak var parent: JSNode?

    convenience init(elementID: ElementID) {
        self.init(
            element: JSNode.body,
            elementID: elementID
        )
    }
    convenience init(named name: String, elementID: ElementID) {
        guard let pageElement = Self.document.createElement(name).object else {
            fatalError("page node not possible")
        }
        
        self.init(
            element: pageElement,
            elementID: elementID, 
            parent: nil,
            events: [:],
            attributes: [:]
        )
    }
    
    private init(element: JSObject, elementID: ElementID, parent: JSNode? = nil, events: [String : JSClosure] = [:], attributes: JSAttributes = [:]) {
        print("INITIALIZING A JSNODE")
        print("THIS IS THE ID \(elementID)")

        self.element = element
        self.events = events
//        self.parent = parent
        self.attributes = attributes
//        self.children = []
        self.elementID = elementID
//        self.isTextComponent = true
    }

    internal func editContent(text: String, append: Bool = false) {
        if append {
            self.element.innerHTML = JSValue.string((self.element.textContent.string ?? "") + text)
            return
        }
        
        self.element.textContent = JSValue.string(text)
    }
    
    internal func removeAttributes() {
        
        for (name, _) in attributes {
            _ = self.element.removeAttribute?(name.description)
        }
        self.attributes = [:]
    }
    
    
    internal func removeEvents() {
        for (name, closure) in events {
            _ = self.element.removeEventListener?(name, closure)
        }
        
        self.events = [:]
    }
    
    // TODO: make this (EventResult) -> Void
    public func addEvent(name: String, closure: @escaping (EventResult) -> Void) {
        // add sailor events to its array
        if name.first == "_" {
            self.sailorEvents[name] = closure
            return
        }
        
        let jsClosure = EventResult.getClosure(name, action: closure)
        self.events[name] = jsClosure
        
        _ = self.element.addEventListener?(name, jsClosure)
    }
 
    
//    func removeFromDOM() {
//        // remove from DOM
//        
//
//    }
    
}


//MARK- Remove?
//extension JSNode {
    //
    //    private func replaceTag(with htmlNode: ElementNode) {
    ////        guard let index = self.parent?.children.firstIndex(where: { $0 === self }) else {
    ////            fatalError("js-node doesnt exist in parent")
    ////        }
    //
    //        guard let pageName = (htmlNode.page as? any Element)?.name else {
    //            fatalError("page not an Element")
    ////            return
    //        }
    //
    //        reset()
    //
    //        if tagName?.uppercased() != pageName.uppercased(),
    //           let parent = self.element.parentElement.object {
    //
    //            let newTag = Self.document.createElement(pageName.uppercased()).object
    //
    //            _ = parent.replaceChild!(newTag, self.element)
    //            // TODO: THIS IS FORCE IS IT OK
    //            self.element = newTag!
    //        }
    //
    //    }
    //
    //    /// shallowly updates node, ie: TextContent, Attributes, & Events
    //    func updateShallow(with node: ElementNode) {
    //        guard let page = node.page as? any Element else { fatalError() }
    //
    //        // if different replace element
    //        if tagName?.uppercased() != page.name.uppercased() {
    //            self.replaceTag(with: node)
    //        }
    //
    //        // remove old events and add new ones
    //
    //        // update text
    //        switch node.content {
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
    //
    //            // Get the length of the children collection
    //            let length = Int(self.element.children.length.number ?? 0)
    //
    //            if length == 0 {
    //                self.editContent(text: "")
    //            }
    //
    //        }
    //
    //        // TODO: diff events and attributes?
    //        // make sure order is the same for attributes
    //
    //        self.removeEvents()
    //
    //        for (name, event) in node.events {
    //            self.addEvent(name: name, closure: event)
    //        }
    //
    //        if node.attributes != self.attributes {
    //            self.removeAttributes()
    //
    //            for (key, value) in node.attributes {
    //                self.updateAttribute(name: key, value: value)
    //            }
    //        }
    //
    //    }
        
        // TODO: REMOVE EVENTS ON EXIT
    //    func reset() {
    //        for child in self.children {
    //            child.removeFromDOM()
    //        }
    //
    //        self.children = []
    ////        self.attributes = [:]
    //        self.removeEvents()
    //        self.removeAttributes()
    //
    //        self.editContent(text: "")
    ////        self.isTextComponent = true
    //
    //    }

        
    //    func addToParent() {
    //        parent?.children.append(self)
    //        _ = parent?.element.appendChild?(self.element)
    //
    //    }
        
    //    func addToDocument() {
    //        _ = Self.document.appendChild(self.element)
    //    }
//}
