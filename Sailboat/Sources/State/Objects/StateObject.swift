//
//  StateObject.swift
//
//
//  Created by Joshua Davis on 10/8/23.
//

@propertyWrapper
public class StateObject<Value: ObservableObject>: Identifiable {
    private var value: Value

    public var wrappedValue: Value {
        get {
            return getValue()
        }
        set {
            setValue(newValue)
        }
    }
    
    public var projectedValue: ObservedObject<Value> {
        ObservedObject(
            get: { self.getValue() },
            set: { self.setValue($0) }
        )
    }
    
    public init(wrappedValue: Value) {
        self.value = wrappedValue
    }
    
    private func getValue() -> Value {
//        SailboatGlobal.manager.dumpDependency(state: self)
        return self.value
    }
    
    private func setValue(_ value: Value) {
        self.value = value
//        SailboatGlobal.manager.eventAdd(state: self)

    }

}
