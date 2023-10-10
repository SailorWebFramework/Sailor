//
//  File.swift
//  
//
//  Created by Joshua Davis on 10/6/23.
//

import Foundation
import JavaScriptKit

// TODO: allow for complex types other than int with Value
struct Event {
    enum Value {
        case int(Int)
        case double(Double)
        case string(String)
    }

    let id: Int
    let value: Int
}

final class App {
    static var idIndex: UInt64 = 0

    static var cssStyles: [String:Style] = [:]
    
    static var pageHierarchy: PageHierarchy? = nil
    
    /// the global values of all the states in application
    static var states: [Any] = []
    
    /// global state accessable from any element must be unique type
    static var environment: [Any] = []
    
    
    static let document = JSObject.global.document


    private static var builtDOM: any Page = Div()
    private static var virtualDOM: any Page {
        pageHierarchy?.root ?? builtDOM
    }
    
    static func set(_ pageHierarchy: PageHierarchy) {
        Self.pageHierarchy = pageHierarchy
    }
        
    /// Recieves string from WASM, map to recieve+event call
    @_silgen_name("send")
    private static func reciever(_ content: String) {
        //TODO: somehow make this call call recieve
    }
    
    /// Recieve events from JavaScript
    static func recieve(_ event: Event) {
        Self.states[event.id] = event.value
        _ = Self.update()

    }
    
    /*
     elementID: organized
     
     state indicies (comma seperated) + "|" + pagename/parsed
     0,1,2,3|asdfd
     
     send update to js
    */
    
    // TODO: update the view if the DOM changed
    static func update() -> Bool {
        let newDOM = virtualDOM
        
        // check if dom must be updated
        if builtDOM == newDOM { return false }
        
        // TODO: update js dom vs newDOM and step through recursively call send update to update page in js
//        for page in builtDOM.body {
//
//        }
        
        
        return true
    }
    
    
    static func sendUpdate(elementID: String, value: some Page) {
//        Self.document.getElementById(elementID).innerHTML = value.description
        
        //TODO: MAKE SURE THERE NO SECURITY RISK OF innerHTML
        var updatedElement = Self.document.getElementById(elementID)
        updatedElement.innerHTML = JSValue(stringLiteral: value.description)
    }
    
    
    static func build(loc: URL) {
        // build pages
        pageHierarchy?.build(loc: loc)
        
        // TODO: build css files
    }

}
