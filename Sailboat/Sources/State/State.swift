//
//  State.swift
//  
//
//  Created by Joshua Davis on 10/8/23.
//

import Foundation

public typealias StateID = String

public protocol Stateful {
    var id: StateID { get }
}

@propertyWrapper
public class State<Value: Equatable>: Identifiable, Stateful {
    
    public let id: StateID = UUID().uuidString
    
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
            set: { self.setValue($0) },
            id: id
        )
    }
    
    public init(wrappedValue: Value) {
        self.value = wrappedValue
        
    }
    
    private func getValue() -> Value {
        SailboatGlobal.manager.dumpDependency(state: self)
        return self.value
    }
    
    private func setValue(_ value: Value) {
        if self.value == value {
            return
        }
        
        self.value = value
        
        SailboatGlobal.manager.eventAdd(state: self)

    }

}
