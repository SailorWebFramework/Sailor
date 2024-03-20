//
//  File.swift
//  
//
//  Created by Joshua Davis on 1/1/24.
//

import JavaScriptKit
import Sailboat
import SailorShared

public final class JSNode {

    public var elementID: ElementID

    public var sailorEvents: SailorEvents = .init()

    internal var element: JSObject

    internal var events: [String: JSClosure] // Events
    
    internal var attributes: [String: String]
    
    public convenience init(elementID: ElementID, _ type: SpecialJSNodeType) {
        self.init(
            element: type.getJSObject(),
            elementID: elementID
        )
    }
    
    public convenience init(named name: String, elementID: ElementID) {
        guard let pageElement = Self.document.createElement(name).object else {
            fatalError("page node not possible")
        }
        
        self.init(
            element: pageElement,
            elementID: elementID
        )
    }
    
    private init(element: JSObject, elementID: ElementID) {
        self.element = element
        self.events = [:]
        self.attributes = [:]
        self.elementID = elementID
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
            _ = self.element.removeAttribute?(name)
        }
        
        self.attributes = [:]
    }
    
    
    internal func removeEvents() {
        for (name, closure) in events {
            _ = self.element.removeEventListener?(name, closure)
        }
        
        self.events = [:]
    }
    
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
    
}
