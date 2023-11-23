//
//  File.swift
//  
//
//  Created by Joshua Davis on 10/8/23.
//

import Foundation

public class Binding<Value> {
    let get: () -> Value
    let set: (Value) -> Void

    var wrappedValue: Value {
        get { get() }
        set { set(newValue) }
    }

    init(get: @escaping () -> Value, set: @escaping (Value) -> Void) {
        self.get = get
        self.set = set
    }
    
}
