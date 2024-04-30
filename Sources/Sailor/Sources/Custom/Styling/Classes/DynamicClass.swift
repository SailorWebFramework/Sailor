//
//  DynamicClass.swift
//
//
//  Created by Joshua Davis on 4/13/24.
//

import Sailboat

public protocol DynamicClass: AttributeValue, CustomStringConvertible  {
    associatedtype ClassBody: DynamicClass
    // TODO: consider renaming
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
