//
//  Style+Property.swift
//
//
//  Created by Joshua Davis on 10/5/23.
//
import Sailboat

extension Style {
    public struct Property: Hashable {
        var name: String
        var value: String
        
        public func hash(into hasher: inout Hasher) {
            hasher.combine(description)
        }
        
        public var description: String {
            "\(self.name):\(self.value)"
        }
        
        internal init(name: String, value: String) {
            self.name = name
            self.value = value
        }
    }
}


