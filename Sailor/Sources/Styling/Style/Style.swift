//
//  File.swift
//  
//
//  Created by Joshua Davis on 10/3/23.
//

// TODO: remove this?
/// Unit associated with style properties
public protocol StyleValue: Hashable {
    var description: String { get }
}

public struct Style: AttributeValue {
    public static func == (lhs: Style, rhs: Style) -> Bool {
        lhs.properties == rhs.properties
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
        // TODO: make this more efficient temporarily sorting all the keys before to ensure same rendering
        let keysSorted = self.properties //.sorted()
        var output = ""
        for property in keysSorted {
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
