//
//  File.swift
//  
//
//  Created by Joshua Davis on 10/8/23.
//

//TODO: should Binding also take in State index to allow for one state to update elements that share listeners
@propertyWrapper
public class Binding<Value: Equatable> {
    let get: () -> Value
    let set: (Value) -> Void

    public var wrappedValue: Value {
        get { get() }
        set { set(newValue) }
    }

    public init(get: @escaping () -> Value, set: @escaping (Value) -> Void) {
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
