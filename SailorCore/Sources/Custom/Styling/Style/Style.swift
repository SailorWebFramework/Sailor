//
//  StylePack.swift
//  
//
//  Created by Joshua Davis on 4/9/24.
//

import Sailboat
import SailorShared

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

// TODO: consider removing later on, neccisary for total CSS elements right now
extension String: Style {
    
    public var style: some Style {
        fatalError("String Style causing infinite recursion")
        return self
    }
    
}
