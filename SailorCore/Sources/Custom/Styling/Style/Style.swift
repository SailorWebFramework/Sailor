//
//  StylePack.swift
//  
//
//  Created by Joshua Davis on 4/9/24.
//

import Sailboat

public protocol Style: AttributeValue, CustomStringConvertible {
    associatedtype StyleBody: Style
    var style: StyleBody { get }
    
}

public extension Style {
    var description: String {
        self.style.description
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.description == rhs.description
    }
}
