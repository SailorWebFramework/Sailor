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
    
    /// global state accessable from any element must be unique type?
    // static var environment: [Any] = []
    
    public static var document = JSObject.global.document
    public static let console = JSObject.global.console
    
    /// the global values of all the states in application
//    internal static var states: [Any] = []
    
    /// the head of the linked list that housees global values of all the states in application
    internal static var states: StateNode = StateNode(value: Date().timeIntervalSince1970)
    
    /// dictionary of events that rely on certain states
    internal static var events: [Int: JSClosure] = [:]

//    internal static var stateInitialValues: [Any] = []

    /// root page being rendered
    internal static var root: (any Page)? = nil
    
    /// root node of virtual dom stored in memory as a tree
    internal static var virtualDOM: DOMNode? = nil

    public static func initialize(root: any Page) {
        Self.root = root
    }

//    public static func newState(value: StateValue) -> StateNode {
//        return Self.states.pushAfter(value)
//    }
    
    public static func console(error: Error) {
        _ = Self.console.error("Error: \(error.localizedDescription)")
    }
    
    public static func build() {
        // build pages
        // TODO: not this? abstract body away? also is tagName neccisary if page copy is there. 
        // Does page copy need to be there?
        Self.virtualDOM = DOMNode(page: Body(), element: App.document.body)
        
        if let root = Self.root,
           let virtualDOM = Self.virtualDOM
        {
            root.build(parentNode: virtualDOM)
        }
        
//        Self.virtualDOM = nil
        
        // TODO: build css files

        // TODO: remove debug tree
        // Self.virtualDOM.printTree()
    }
    
}
