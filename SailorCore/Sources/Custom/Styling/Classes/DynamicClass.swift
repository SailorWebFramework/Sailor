//
//  DynamicClass.swift
//
//
//  Created by Joshua Davis on 4/13/24.
//

import Sailboat

public protocol DynamicClass: AttributeValue, CustomStringConvertible  {
    associatedtype ClassBody: DynamicClass
    var classes: ClassBody { get }
}

public extension DynamicClass {
    var description: String {
        classes.description
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.description == rhs.description
    }
}

public protocol DynamicClassContainer: DynamicClass { }

extension DynamicClassContainer {
    public var classes: some DynamicClass {
        fatalError("Classable string does not have body")
        return ""
    }
}

public struct ClassGroup: DynamicClassContainer {
    public var description: String {
        self.value
    }
    
    internal var value: String
    
    init(@ClassBuilder _ classes: () -> String) {
        self.value = classes()
    }
    
    internal init(_ value: String) {
        self.value = value
    }


}

extension String: DynamicClassContainer { }
