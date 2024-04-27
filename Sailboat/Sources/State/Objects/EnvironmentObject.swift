//
//  File.swift
//  
//
//  Created by Joshua Davis on 3/8/24.
//

@propertyWrapper
public class EnvironmentObject<Value: ObservableObject> {
    
    public var wrappedValue: Value {
        return getValue()
    }
    
    public var projectedValue: ObservedObject<Value> {
        ObservedObject(
            get: { self.getValue() },
            set: { _ in }
        )
    }
    
    // TODO: make this id thing a helper
    internal var getID: String { String(describing: Value.self) }
    
    public init() { }
    
    private func getValue() -> Value {
        //TODO: do i dump
//        SailboatGlobal.manager.dumpDependency(state: self)
        return SailboatGlobal.manager.objects[self.getID] as! Value
    }

}
