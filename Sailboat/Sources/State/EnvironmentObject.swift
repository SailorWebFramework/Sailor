//
//  File.swift
//  
//
//  Created by Joshua Davis on 3/8/24.
//

import Foundation


@propertyWrapper
public class EnvironmentObject<Value: Equatable>: Stateful {
    
    public let id: StateID = UUID().uuidString
    
//    private var value: Value

    public var wrappedValue: Value {
        return getValue()
    }
    
    public var projectedValue: Binding<Value> {
        Binding(
            get: { self.getValue() },
            set: { _ in },
            id: self.getID
        )
    }
    
    internal var getID: String { String(describing: type(of: self)) }
    
    public init() { }
    
    private func getValue() -> Value {
        SailboatGlobal.manager.dumpDependency(state: self)
        return SailboatGlobal.manager.objects[self.getID] as! Value
    }

}
