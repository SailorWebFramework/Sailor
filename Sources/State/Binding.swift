//
//  File.swift
//  
//
//  Created by Joshua Davis on 10/8/23.
//

import Foundation

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
        // TODO: when using the init redraw DOM
        self.set = set
    }
    
}
