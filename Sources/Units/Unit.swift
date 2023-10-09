//
//  File.swift
//  
//
//  Created by Joshua Davis on 10/6/23.
//

import Foundation

/// Umbrella for units across Sailor
public enum Unit { }

/// Unit associated with attrubutes
public protocol AttributeValue: Hashable, CustomStringConvertible {
    
    var description: String { get }
//    func render() -> String
}

/// Unit associated with style properties
public protocol CSSValue: Hashable {
    var description: String { get }
//    func render() -> String
}
