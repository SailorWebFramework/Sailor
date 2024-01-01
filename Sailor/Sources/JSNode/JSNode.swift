//
//  File.swift
//  
//
//  Created by Joshua Davis on 1/1/24.
//

import Foundation
import Sailboat
import JavaScriptKit

// TODO: use this to render and update reconcile NOT JSOBJECT NEVER JSOBJECT!!
class JSNode {
    private var children: [JSNode]
    private var element: JSObject
    private var events: [String: [JSClosure]]
    
    init(element: JSObject, events: [String : [JSClosure]]) {
        self.element = element
        self.events = events
        self.children = []
    }
    
    func addEvent(name: String, closure: (EventResult) -> Void) {
        
    }
    
    func editContent(text: String) {
        
    }
    
    func removeEvents() {
        
    }
    
    
    func replace(attributes: Attributes) {
        // diff and replace attributes in element
    }
    
    
    func addChild(_ child: JSNode) {
        // add child given we are parent
    }
    
    func removeFromDOM() {
        // remove from DOM
    }
    
}
