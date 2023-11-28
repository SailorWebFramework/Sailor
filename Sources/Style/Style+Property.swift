//
//  File.swift
//  
//
//  Created by Joshua Davis on 10/5/23.
//

import Foundation

public extension Style {
    struct Property: Hashable, Comparable {
        public static func == (lhs: Property, rhs: Property) -> Bool {
            lhs.hashValue == rhs.hashValue
        }

        public static func <(lhs: Property, rhs: Property) -> Bool {
            lhs.name < rhs.name
        }
        
        public func hash(into hasher: inout Hasher) {
            hasher.combine(name)
            hasher.combine(value)
        }
        
        var name: String
        var value: any CSSValue

    }
}
