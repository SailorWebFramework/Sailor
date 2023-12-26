//
//  File.swift
//  
//
//  Created by Joshua Davis on 11/24/23.
//

import Foundation

extension Operator {
    public var description: String {
        "Operator(type: \(type(of: self)), id: \(self.id)"
    }
}
