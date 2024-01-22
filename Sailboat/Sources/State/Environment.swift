//
//  File.swift
//  
//
//  Created by Joshua Davis on 10/8/23.
//

// TODO: dictionary use thing so   @Environment(\.myCustomSetting) var mySetting works?
// TODO: somehow pass it down

@propertyWrapper
public class Environment<Value: Equatable> {
    let get: () -> Value
    let set: (Value) -> Void

    public var wrappedValue: Value {
        get { get() }
        set { set(newValue) }
    }

    public init(get: @escaping () -> Value, set: @escaping (Value) -> Void) {
        fatalError("Not implemented yet")
        self.get = get
        self.set = set
    }
    
    static func constant(_ value: Value) -> Binding<Value> {
        Binding(
            get: { value },
            set: { _ in }
        )
    }
    
}
