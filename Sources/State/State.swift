//
//  State.swift
//  
//
//  Created by Joshua Davis on 10/8/23.
//

import Foundation


//TODO: use reflections Mirror maybe
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
//        self.node = App.states.pushAfter(wrappedValue)
        self.node = App.states.append(wrappedValue)


    }
    
    // TODO: fix state not deiniting properly look at example, happens when an initially built view leaves the DOM
    deinit {
        print("Deinitializing State: \(self.node)")
        self.node.remove()
    }
    
    // TODO: update the index and remove old state / make this a pointer to Value
    public func inject(index: Value) {
        
//        self.index = index
    }
    
    private func getValue() -> Value {
        // TODO: UNSAFE, but probably fine
//        (App.states[index] as! Value)
        self.node.value as! Value
    }
    
    private func setValue(_ value: Value) {
        // TODO: check if no change conform to equatable?
//        if App.states[index] as? Value == value {
//            return
//        }
        
        if self.node.value as? Value == value {
            return
        }
        
//        if let node = self.node {

            // TODO: Maybe batch updates eventually
        App.update(state: self.node, newValue: value)
            
//        }

    }

}
