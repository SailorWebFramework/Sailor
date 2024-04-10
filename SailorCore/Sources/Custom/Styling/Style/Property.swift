//
//  Style+Property.swift
//
//
//  Created by Joshua Davis on 10/5/23.
//
import Sailboat

public struct Property: StyleAdjacent {
    var name: String
    var value: String
    
    internal init(name: String, value: String) {
        self.name = name
        self.value = value
    }
}

extension Property: Hashable, CustomStringConvertible {

    public var description: String {
        "\(self.name):\(self.value)"
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(description)
    }
    
}


