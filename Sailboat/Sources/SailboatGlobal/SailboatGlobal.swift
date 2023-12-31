//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/29/23.
//

import Foundation


public final class SailboatGlobal {
    public static var shared: (any GlobalDOMManager)! = nil
    
    public static func initialize(_ sailboatManager: any GlobalDOMManager) {
        shared = sailboatManager
    }
    
    /// the head of the linked list that houses global values of all the states in application
//    public let states: LinkedList<StateValue> = LinkedList()
     
    /// global state accessable from any element must be unique type?
    //static var environment: StateNode = StateNode(value: Date().timeIntervalSince1970)
    
    
//    public static func resetShared() {
//        Self.shared = DefaultManager()
//    }
    
}
