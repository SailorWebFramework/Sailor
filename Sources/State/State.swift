//
//  State.swift
//  
//
//  Created by Joshua Davis on 10/8/23.
//

import Foundation

@propertyWrapper
public class State<Value> {
    private let index: Int

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
        self.index = App.states.count
        App.states.append(wrappedValue)

    }
    
    private func getValue() -> Value {
        // TODO: UNSAFE, but probably fine
        (App.states[index] as! Value)
    }
    
    private func setValue(_ value: Value) {
        // TODO: update the Virtual DOM here / send JS update
        App.states[index] = value
        App.update()
        
    }

}
