//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/29/23.
//

import Foundation

//public protocol StateDelegate {
//    static var shared: any StateDelegate { get  }
//    var states: LinkedList<StateValue> { get  }
//
//    init()
//
//    func build(root: any Page)
//    func update(state: StateNode, newValue: StateValue)
//    func update()
//
//}
//
//extension StateDelegate {
//
//    public func update() { fatalError("Override the SailboatGlobal update() function to update data after state") }
//
//    // TODO:
//    public func build(root: any Page) { fatalError("build not implemented") }
//}

public final class SailboatGlobal {
    public static let shared = SailboatGlobal()
    
    /// the head of the linked list that houses global values of all the states in application
    public let states: LinkedList<StateValue> = LinkedList()
     
    /// global state accessable from any element must be unique type?
    //static var environment: StateNode = StateNode(value: Date().timeIntervalSince1970)
    
    public init() { }
    
    /// updates the global state, override this to diff DOM
    public func update(state: StateNode, newValue: StateValue, body: @escaping () -> Void) {
        state.value = newValue
        
        body()
    }

}
