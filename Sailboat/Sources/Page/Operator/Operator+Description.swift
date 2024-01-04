//
//  File.swift
//  
//
//  Created by Joshua Davis on 11/24/23.
//

extension Operator {
    public var description: String {
        "Operator(type: \(type(of: self)), id: \(self.id), children: \(children.count)"
    }
}
