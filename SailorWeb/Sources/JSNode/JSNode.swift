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
    public var sid: SailboatID?

    ///
    internal var element: JSObject

    // TODO: remove this
    ///
    internal var events: [String: JSClosure] // Events
    
    // TODO: remove this
    /// The built key and values of the attributes
    internal var attributes: [String: any AttributeValue]
    
    public convenience init(_ type: SpecialJSNodeType, sid: SailboatID? = nil) {
        self.init(
            element: type.getJSObject(),
            sid: sid
        )
    }
    
    public convenience init(named name: String, sid: SailboatID? = nil) {
        guard let pageElement = Self.document.createElement(name).object else {
            fatalError("page node not possible")
        }
        
        self.init(
            element: pageElement,
            sid: sid
        )
    }
    
    private init(element: JSObject, sid: SailboatID? = nil) {
        self.element = element
        self.events = [:]
        self.attributes = [:]
        self.sid = sid
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
}
