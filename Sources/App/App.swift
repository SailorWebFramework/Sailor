//
//  File.swift
//  
//
//  Created by Joshua Davis on 10/6/23.
//

import Foundation
import JavaScriptKit

public final class App {
    static var idIndex: UInt64 = 0

    static var cssStyles: [String:Style] = [:]
        
    /// the global values of all the states in application
    static var states: [Any] = []
    
    /// global state accessable from any element must be unique type
    static var environment: [Any] = []
    
    public static var document = JSObject.global.document

    private static var root: any Page = Div()
    
    public static func initialize(root: any Page) {
        Self.root = root
    }

    // TODO: update the view if the DOM changed
    static func update(state: Int? = nil) -> Bool {
        print("UPDATING DOM")

        // TODO: Remove and diff , dont delete everything
        App.document.body.innerHTML = ""
        build(parent: App.document.body)
        
        
        
        // TODO: Diffing algorithm
//        if let page = Self.root.children as? any HTMLElement {
//             print("YOEOOEOEY")
//             page.element.remove()
//        }
        // if let body = App.document.body {
            
        // let children: JSValue = App.document.body
        
        // Iterate over all child nodes of the body
        // for child in children.childNodes {
        //     // Remove each child from the body
        //     child.remove()
        // }

        // } else {
        //     print("NOTHING FOUND IN BODY")

        // }
        
        return true
    }
    
    public static func build(parent: JSValue = App.document.body) {
        // build pages
        Self.root.build(parent: parent)
        
        // TODO: build css files
    }
    
}
