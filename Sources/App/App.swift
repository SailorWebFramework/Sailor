//
//  File.swift
//  
//
//  Created by Joshua Davis on 10/6/23.
//

import Foundation
import JavaScriptKit

public final class App {
    // static var cssStyles: [String:Style] = [:]
        

    
    /// global state accessable from any element must be unique type
    // static var environment: [Any] = []
    
    public static var document = JSObject.global.document
    public static let console = JSObject.global.console
    
    /// the global values of all the states in application
    internal static var states: [Any] = []

    internal static var root: (any Page)? = nil
    internal static var virtualDOM: DOMNode = DOMNode(page: Body(), element: App.document.body)

    public static func initialize(root: any Page) {
        Self.root = root
    }

    public static func newState(value: Any) -> Int {
        Self.states.append(value)
        return Self.states.count - 1
    }
    
    public static func console(error: Error) {
        _ = Self.console.error("Error: \(error.localizedDescription)")
    }
    
    public static func build() {
        // build pages
        // TODO: not this? abstract body away?
        Self.virtualDOM = DOMNode(page: Body(), element: App.document.body)
        if let root = Self.root {
            root.build(parentNode: Self.virtualDOM)
        }
        
        // TODO: build css files

        // TODO: remove debug tree
        // Self.virtualDOM.printTree()
    }
    
}
