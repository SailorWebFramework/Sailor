//
//  Style+Property.swift
//
//
//  Created by Joshua Davis on 10/5/23.
//

import Sailboat

public struct Property: Style, Hashable {
    var name: String
    var value: String
    
    public var description: String {
        "\(name): \(value);"
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(description)
    }
    
    public var style: some Style {
        fatalError("Property does not contain a body of styles")
        return self
    }
    
    internal init(name: String, value: String) {
        self.name = name
        self.value = value
    }
    
}

//extension Property: Hashable, CustomStringConvertible {
//
//    public var description: String {
//        "\(self.name):\(self.value)"
//    }
//    
//    public func hash(into hasher: inout Hasher) {
//        hasher.combine(description)
//    }
//    
//}


