//
//  File.swift
//  
//
//  Created by Joshua Davis on 10/8/23.
//

import Foundation

@propertyWrapper
struct State<Value> {
    private let index: Int

    var wrappedValue: Value {
        get {
            return getValue()
            
        }
        set {
            setValue(newValue)
        }
    }
    
    init(wrappedValue: Value) {
        self.index = App.states.count
        App.states.append(wrappedValue) // TODO: make Error
        
        print("APP State:", App.states)
        // TODO: somehow register the state index so JS knows what state is being updated? put in ID field of componenets?
    }
    
    private func getValue() -> Value {
        // TODO: UNSAFE, but probably fine
        (App.states[index] as! Value)
    }
    
    private func setValue(_ value: Value) {
        // TODO: update the Virtual DOM here / send JS update
        App.states[index] = value
        
    }
    
    var projectedValue: Binding<Value> {
        Binding(
            get: { self.getValue() },
            set: { self.setValue($0) }
        )
    }

}
