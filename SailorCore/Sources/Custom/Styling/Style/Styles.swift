//
//  Styles.swift
//
//
//  Created by Joshua Davis on 10/3/23.
//

//public protocol StyleAdjacent { }

//public struct Styles: StyleAdjacent, Equatable {
//    // TODO: fix this?
//    public static func == (lhs: Styles, rhs: Styles) -> Bool {
//        if lhs.properties.count != rhs.properties.count {
//            return false
//        }
//        return lhs.description == rhs.description
//    }
//    
//    public static func none() -> Styles { Styles() }
//    
//    static func + (left: Styles, right: Styles) -> Styles {
//        var copy = left
//        copy.properties.append(contentsOf: right.properties)
//        return copy
//    }
//    
//    public var properties: [any StyleAdjacent]
//    
//    public var isEmpty: Bool {
//        properties.isEmpty
//    }
//    
//    public var description: String {
//        // TODO: make this more efficient temporarily sorting all the keys before to ensure same rendering
//        let keysSorted = self.properties //.sorted()
//        var output = ""
//        for property in keysSorted {
//            if let property = property as? Property {
//                output += "\(property.name): \(property.value);"
//            } else if let property = property as? Styles {
//                output += property.description
//            } else if let property = property as? any Style {
//                output += property.styles.description
//            }
//        }
//        
//        return output
//    }
//    
//    // TODO: make a named init with mustache
//    public init(_ properties: (any StyleAdjacent)...) {
//        self.properties = properties
//    }
//    
//    public init(_ properties: [any StyleAdjacent]) {
//        self.properties = properties
//    }
//    
//    public init(@StyleBuilder _ style: () -> Styles) {
//        self.properties = style().properties
//    }
//
//}