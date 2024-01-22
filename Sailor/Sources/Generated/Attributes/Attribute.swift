//
//  Attribute.swift
//  
//
//  Created by Joshua Davis on 10/6/23.
//

import Sailboat

//TODO: consider leaving only custom and makeing whole attribute lib using extensions and custom Attributes

// CustomStringConvertible
//public enum Attribute: String, CustomStringConvertible, Equatable, Comparable, Attributable {
//    case src(String),
//         style(Style),
//         className,
//         alt(String),
//         width(Int),
//         height(Int),
//         tabindex(Int),
//         value(String) //, custom(String)
//
//    public var description: String { self.rawValue }
//
//    public static func ==(lhs: Attribute, rhs: Attribute) -> Bool {
//        return lhs.description == rhs.description
//    }
//
//    public static func <(lhs: Attribute, rhs: Attribute) -> Bool {
//        return lhs.description < rhs.description
//    }
//}

public enum Attribute: CustomStringConvertible, Equatable, Comparable, Attributable {
    case style(Style),
         width(Int),
         height(Int)
    
    public var description: String {
        switch self {
        case .style(let value):
            return "style(\(value.description))"
        case .width(let value):
            return "width(\(value.description))"
        case .height(let value):
            return "height(\(value.description))"
        }
    }
    
    public var name: String {
        switch self {
        case .style(_):
            return "style"
        case .width(_):
            return "width"
        case .height(_):
            return "height"
        }
    }
    
    public var value: String {
        switch self {
        case .style(let value):
            return value.description
        case .width(let value):
            return value.description
        case .height(let value):
            return value.description
        }
    }

    public static func ==(lhs: Attribute, rhs: Attribute) -> Bool {
        return lhs.description == rhs.description
    }

    public static func <(lhs: Attribute, rhs: Attribute) -> Bool {
        return lhs.description < rhs.description
    }
}
