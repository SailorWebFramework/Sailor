//
//  File.swift
//  
//
//  Created by Joshua Davis on 10/8/23.
//

@propertyWrapper
public class Binding<Value: Equatable>: Stateful {
    public let id: StateID

    public let get: () -> Value
    public let set: (Value) -> Void

    public var wrappedValue: Value {
        get { get() }
        set { set(newValue) }
    }
    
    public var projectedValue: Binding<Value> {
        self
    }

    public init(get: @escaping () -> Value, set: @escaping (Value) -> Void, id: StateID) {
        self.get = get
        self.set = set
        self.id = id
    }
    
    static func constant(_ value: Value) -> Binding<Value> {
        Binding(
            get: { value },
            set: { _ in },
            id: 0 // no other state should have ID 0, reserved for const
        )
    }
    
}
