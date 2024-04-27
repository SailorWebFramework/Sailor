//
//  ObservedObject.swift
//
//
//  Created by Joshua Davis on 4/27/24.
//

@propertyWrapper
public class ObservedObject<Value: ObservableObject>: Identifiable {
    public let get: () -> Value
    public let set: (Value) -> Void

    public var wrappedValue: Value {
        get {
            get()
        }
        set {
            set(newValue)
        }
    }
    
    public var projectedValue: ObservedObject<Value> {
        self
    }
    
    public init(get: @escaping () -> Value, set: @escaping (Value) -> Void) {
        self.get = get
        self.set = set
        
    }
    
//    public init(wrappedValue: Value) {
//        self.value = wrappedValue
//    }
    
//    private func getValue() -> Value {
////        SailboatGlobal.manager.dumpDependency(state: self)
//        return self.value
//    }
//    
//    private func setValue(_ value: Value) {
//        if self.value == value {
//            return
//        }
//        
//        self.value = value
//        
////        SailboatGlobal.manager.eventAdd(state: self)
//
//    }

}
