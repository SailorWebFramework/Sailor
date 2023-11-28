//
//  Attribute.swift
//  
//
//  Created by Joshua Davis on 10/6/23.
//

import Foundation

//TODO: consider leaving only custom and makeing whole attribute lib using extensions and custom Attributes

// CustomStringConvertible
public enum Attribute: String, CustomStringConvertible, Equatable, Comparable {
    case src, style, className, alt, width, height, tabindex //, custom(String)
    
    public var description: String { self.rawValue }

    public static func ==(lhs: Attribute, rhs: Attribute) -> Bool {
        return lhs.description == rhs.description
    }

    public static func <(lhs: Attribute, rhs: Attribute) -> Bool {
        return lhs.description < rhs.description
    }
}
