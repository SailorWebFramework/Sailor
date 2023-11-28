//
//  File.swift
//  
//
//  Created by Joshua Davis on 10/3/23.
//

import Foundation

public struct Style: AttributeValue {
    public static func == (lhs: Style, rhs: Style) -> Bool {
        false
    }
    
    public static func none() -> Style { Style() }
    
    static func + (left: Style, right: Style) -> Style {
        var copy = left
        copy.properties.formUnion(right.properties)
        return copy
    }
    
    public var properties: Set<Property>
    
    public var isEmpty: Bool {
        properties.isEmpty
    }
    
    public var description: String {
        var output = ""
        
        for property in properties {
            output += "\(property.name): \(property.value);"
        }
        
        return output
    }
    
    // TODO: make a named init with mustache
    public init(_ properties: Property...) {
        self.properties = Set(properties)
    }
    
    public init(_ properties: [Property]) {
        self.properties = Set(properties)
    }

}
