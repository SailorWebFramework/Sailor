//
//  File.swift
//  
//
//  Created by Joshua Davis on 10/8/23.
//


public protocol SomeEnvironment { }

@propertyWrapper
public class Environment<TargetEnvironment: SomeEnvironment, Value> {
    
    var keyPath: KeyPath<TargetEnvironment, Value>?

    // TODO: check this is force casting
    public var wrappedValue: Value {
        let env = (SailboatGlobal.manager.environment as? TargetEnvironment)
        print("forcing environment")
        if let keyPath = self.keyPath {
            return env![keyPath: keyPath]
        }
        return env as! Value
    }

    public init(_ keyPath: KeyPath<TargetEnvironment, Value>) {
        self.keyPath = keyPath
    }
    
    public init() {
        keyPath = nil
    }
    
}
