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

public final class App {
    static var idIndex: UInt64 = 0

    static var cssStyles: [String:Style] = [:]
    
    static var pageHierarchy: PageHierarchy? = nil
    
    /// the global values of all the states in application
    static var states: [Any] = []
    
    /// global state accessable from any element must be unique type
    static var environment: [Any] = []
    
    public static var document = JSObject.global.document

    private static var builtDOM: any Page = Div()
    private static var virtualDOM: any Page {
        pageHierarchy?.root ?? builtDOM
    }
    
    public static func set(_ pageHierarchy: PageHierarchy) {
        Self.pageHierarchy = pageHierarchy
    }
        
    /// Recieves string from WASM, map to recieve+event call
    /// Recieve events from JavaScript
    static func recieve(_ event: Event) {
        Self.states[event.id] = event.value
        _ = Self.update()

    }
    
    /*
     send update to js
    */
    
    // TODO: update the view if the DOM changed
    static func update() -> Bool {
        print("UPDATING DOM")
        App.document.body.innerHTML = ""
        build(parent: App.document.body)

        // TODO: Diffing algorithm
        // if let page = builtDOM.body as? any HTMLElement {
        //     print("YOEOOEOEY")
        //     page.element.remove()
        // }
        // if let body = App.document.body {
            
        // let children: JSValue = App.document.body
        // print("CHILDNODES ISNT EMPTY")
        
        // Iterate over all child nodes of the body
        // for child in children.childNodes {
        //     // Remove each child from the body
        //     child.remove()
        // }

        // } else {
        //     print("NOTHING FOUND IN BODY")

        // }
        
        // let newDOM = virtualDOM


        // self.virtualDOM = 
        
        // check if dom must be updated
        
        // TODO: update js dom vs newDOM and step through recursively call send update to update page in js
        // func diff(_ builtDOMTree: inout any Page, _ virtualDOMTree: inout any Page) {
        //     // check if current tree is the same, if so return
        //     if builtDOMTree == virtualDOMTree { return }
        // }  
        // diff(&builtDOM, &newDOM)


        return true
    }
    
    
//     static func sendUpdate(elementID: String, value: some Page) {
// //        Self.document.getElementById(elementID).innerHTML = value.description
        
//         //TODO: MAKE SURE THERE NO SECURITY RISK OF innerHTML
//         // var updatedElement = Self.document.getElementById(elementID)
//         // updatedElement.innerHTML = JSValue(stringLiteral: value.description)
//     }
    
    public static func build(parent: JSValue) {
        // build pages
        pageHierarchy?.build(parent: parent)
        
        // TODO: build css files
    }
    
    /// TODO: launches event listeners that call App.recieve server in wasm
    /// maybe move to App rather than PageHierarchy
    public func start() {
//        App.createListeners()
    }

}
