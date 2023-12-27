//
//  State.swift
//  
//
//  Created by Joshua Davis on 10/8/23.
//

import Foundation

public typealias StateValue = any Equatable
typealias StateNode = LinkedListNode<StateValue>

@propertyWrapper
public class State<Value: Equatable> {
    
    private var node: StateNode

    public var wrappedValue: Value {
        get {
            return getValue()
        }
        set {
            setValue(newValue)
        }
    }
    
    public var projectedValue: Binding<Value> {
        Binding(
            get: { self.getValue() },
            set: { self.setValue($0) }
        )
    }
    
    public init(wrappedValue: Value) {
        self.node = SailorGlobal.states.append(wrappedValue)
    }
    
    // TODO: fix state not deiniting properly look at example, happens when an initially built view leaves the DOM
    deinit {
        print("Deinitializing State: \(self.node)")
        self.node.remove()
    }
    
    private func getValue() -> Value {
        // TODO: UNSAFE, but probably fine
        self.node.value as! Value
    }
    
    private func setValue(_ value: Value) {
        // TODO: check if no change conform to equatable?
        
        if self.node.value as? Value == value {
            return
        }
        
        // TODO: Maybe batch updates eventually
        SailorGlobal.update(state: self.node, newValue: value)
        
    }

}
