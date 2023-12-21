//
//  File.swift
//  
//
//  Created by Joshua Davis on 10/6/23.
//

import Foundation
import JavaScriptKit

public final class App {
    // TODO: css files
    // static var css: [String:Style] = [:]
    
    public static var document = JSObject.global.document
    public static let console = JSObject.global.console

    /// the head of the linked list that housees global values of all the states in application
//    internal static var states: StateNode = StateNode(value: Date())
    internal static var states: LinkedList<StateValue> = LinkedList() //StateNode(value: Date())

    /// dictionary of events that rely on certain states
    //internal static var events: [Int: JSClosure] = [:]
    
    /// global state accessable from any element must be unique type?
    //static var environment: StateNode = StateNode(value: Date().timeIntervalSince1970)

    /// root node of virtual dom stored in memory as a tree
    internal static var virtualDOM: DOMNode? = nil
    
    public static func main() {
        
    }
    
    public static func console(error: Error) {
        _ = Self.console.error("Error: \(error.localizedDescription)")
    }
    
    public static func build(root: any Page) {
        // Does page copy need to be there?
        Self.virtualDOM = DOMNode(page: Body(), element: App.document.body)

        if let virtualDOM = Self.virtualDOM {
            BuildFactory.build(page: root, parentNode: virtualDOM)
        }
        
//        Self.virtualDOM?.printTree()
//        print("States nodes:", states.total())
        // TODO: build css files

    }
    
}
