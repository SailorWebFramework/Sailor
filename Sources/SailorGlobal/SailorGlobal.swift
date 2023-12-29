//
//  SailorGlobal.swift
//  
//
//  Created by Joshua Davis on 10/6/23.
//

import Foundation
import JavaScriptKit

// TODO: make a singleton?
final class SailorGlobal {
    // TODO: css files
    // static var css: [String:Style] = [:]
    
    public static var document = JSObject.global.document
    public static let console = JSObject.global.console

    public static let documentBody = document.body.object // TODO: should i force this
    
    /// the head of the linked list that houses global values of all the states in application
    internal static var states: LinkedList<StateValue> = LinkedList() //StateNode(value: Date())
    
    /// global state accessable from any element must be unique type?
    //static var environment: StateNode = StateNode(value: Date().timeIntervalSince1970)

    /// dictionary of events that rely on certain states
    //internal static var events: [Int: JSClosure] = [:]
    
    /// root node of virtual dom stored in memory as a tree
//    internal static var virtualDOM: CustomNode? = nil
    
    /// root node of the HTML body in memory as the virtual dom
    internal static var bodyNode: CustomNode? = nil
    
    ///
    internal static var headNode: CustomNode? = nil
    
    public static func build(root: any Page) {
        guard let documentBody = documentBody else { return }
        
        // set the root node of body dom tree
        Self.bodyNode = CustomNode(page: root, aboveElement: documentBody)

        // build virtual dom body
        Self.bodyNode?.build(child: Self.bodyNode!.page.body)

        // debug prints
        Self.bodyNode?.printNode()
        Self.states.printList()

        // TODO: build css files assets?
        
    }
 
}
