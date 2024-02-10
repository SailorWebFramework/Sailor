//
//  File.swift
//  
//
//  Created by Joshua Davis on 10/8/23.
//

//TODO: allow for one state to update elements that share listeners
@propertyWrapper
public class Binding<Value: Equatable> {
    public let get: () -> Value
    public let set: (Value) -> Void

    public var wrappedValue: Value {
        get { get() }
        set { set(newValue) }
    }
    
    public var projectedValue: Binding<Value> {
        self
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
