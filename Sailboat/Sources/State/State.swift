//
//  State.swift
//  
//
//  Created by Joshua Davis on 10/8/23.
//

import Foundation

public typealias StateValue = any Equatable
public typealias StateNode = LinkedListNode<StateValue>

@propertyWrapper
public class State<Value: Equatable> {
//    private var node: StateNode
    
    private var value: Value

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
//        self.node = SailboatGlobal.shared.states.append(wrappedValue)
        self.value = wrappedValue
//        Self.count += 1

    }
    
    // TODO: fix state not deiniting properly look at example, happens when an initially built view leaves the DOM
//    deinit {
////        print("Deinitializing State: \(self.node)")
////        SailboatGlobal.shared.states.remove(self.node)
//    }
    
    private func getValue() -> Value {
        // TODO: UNSAFE, but probably fine
//        self.node.value as! Value
        self.value

    }
    
    private func setValue(_ value: Value) {
        // TODO: check if no change conform to equatable?
        
        if self.value == value {
            return
        }
        
        self.value = value
        
        SailboatGlobal.shared.update()

        // TODO: Maybe batch updates eventually
//        SailboatGlobal.shared.update(state: self.node, newValue: value)

    }

}
