//
//  State.swift
//  
//
//  Created by Joshua Davis on 10/8/23.
//

public typealias StateValue = any Equatable
public typealias StateNode = LinkedListNode<StateValue>

@propertyWrapper
public class State<Value: Equatable> {
    private var value: Value

    public var wrappedValue: Value {
        get {
            return getValue()
        }
        set {
            setValue(newValue)
        }
    }
    
    public var projectedValue: Binding<Value> {
        Binding(
            get: { self.getValue() },
            set: { self.setValue($0) }
        )
    }
    
    public init(wrappedValue: Value) {
        self.value = wrappedValue
    }
    
    private func getValue() -> Value {
        self.value
    }
    
    private func setValue(_ value: Value) {
        if self.value == value {
            return
        }
        
        self.value = value
        
        SailboatGlobal.manager.update()

        // TODO: Maybe batch updates eventually
//        SailboatGlobal.shared.update(state: self.node, newValue: value)

    }

}
