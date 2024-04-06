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

    ///
    public var elementID: ElementID

    ///
    public var sailorEvents: SailorEvents

    ///
    internal var element: JSObject

    ///
    internal var events: [String: JSClosure] // Events
    
    /// The built key and values of the attributes
    internal var attributes: [String: any AttributeValue]
    
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
        self.sailorEvents = SailorEvents(from: elementID)
    }

    // TODO: remove append and default to it?
    internal func appendContent(text: String) {
        let newTextNode = Self.document.createTextNode(JSValue.string(text))
        _ = self.element.appendChild?(newTextNode)
        
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
        // TODO: verify this, sailor events now stored on DOM
        // add sailor events to its array, skip sailor events
//        if name.first == "_" {
//            return
//        }
        
        print("ADDING EVENT \(name)")
        
        
        let jsClosure = EventResult.getClosure(name, action: closure)
        self.events[name] = jsClosure
        
        _ = self.element.addEventListener?(name, jsClosure)
    }

    
}
