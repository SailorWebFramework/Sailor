//
//  File.swift
//  
//
//  Created by Joshua Davis on 10/6/23.
//

import Foundation
import JavaScriptKit

public final class App {
    static var cssStyles: [String:Style] = [:]
        
    /// the global values of all the states in application
    private(set) static var states: [Any] = []
    
    /// global state accessable from any element must be unique type
    static var environment: [Any] = []
    
    public static var document = JSObject.global.document
    public static let console = JSObject.global.console
    
    private static var root: any Page = Div()
    //    private static var tree: DOMTree
    // {
    //   name: TestPage
    //   content: ""
    //   attributes: ["src": hello", "width": 10]
    //   body: { name: Div, content: "hello world", body: {} }
    //
    //
    //}
    
    public static func initialize(root: any Page) {
        Self.root = root
    }

    public static func initState(value: Any) -> Int {
        Self.states.append(value)
        return Self.states.count - 1
    }

    // TODO: update the view if the DOM changed
    static func update(state: Int, newValue: Any) {
        print("UPDATING DOM")

        // TODO: Remove and diff , dont delete everything
        App.document.body.innerHTML = ""
        build(parent: App.document.body)
        
        // simple diff 1.0
        
        // loop over old dom and new dom

        // if element is the same do nothing continue in loop
            
        // else the dom falls in one of three simplified states (could be multiple)
            // replaced an element
                // compare if types are different
                // if same -> compare value, recurse page, or replace html component
                // if different -> replace

            // added a new element in between
                // cache the old element with pointer
                // if future value is cache then append new element before when updating

            // removed an element
                // cache the old element with pointer
                // if never found remove element from dom at the end
        
        // update the state
        Self.states[state] = newValue
    }
    
    public static func console(error: Error) {
        _ = Self.console.error("Error: \(error.localizedDescription)")
    }
    
    public static func build(parent: JSValue = App.document.body) {
        // build pages
        Self.root.build(parent: parent)
        
        // TODO: build css files
    }
    
}
