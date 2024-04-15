//
//  DynamicClassContainer.swift
//
//
//  Created by Joshua Davis on 4/13/24.
//

import Sailboat

public protocol DynamicClassContainer: DynamicClass { }

extension DynamicClassContainer {
    public var classes: some DynamicClass {
        fatalError("DynamicClassContainer does not have body")
        return ""
    }
}

public struct ClassGroup: DynamicClassContainer {
    public var description: String {
        self.value
    }
    
    internal var value: String
    
    public init(@ClassBuilder _ classes: () -> String) {
        self.value = classes()
    }
    
    internal init(_ value: String) {
        self.value = value
    }
}

extension String: DynamicClassContainer { }
