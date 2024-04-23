//
//  File.swift
//  
//
//  Created by Joshua Davis on 3/8/24.
//

@propertyWrapper
public class EnvironmentObject<Value: ObservableObject>: Stateful {
    
    // TODO: this doesnt need to be registerd
    public let id: StateID = ManagedStates.registerID()
    
    public var wrappedValue: Value {
        return getValue()
    }
    
    public var projectedValue: Binding<Value> {
        Binding(
            get: { self.getValue() },
            set: { _ in },
            id: self.id // TODO: this doesnt work create a map to a stateID from the string getID
        )
    }
    
    internal var getID: String { String(describing: Value.self) }
    
    public init() { }
    
    private func getValue() -> Value {
        SailboatGlobal.manager.dumpDependency(state: self)
        return SailboatGlobal.manager.objects[self.getID] as! Value
    }

}
