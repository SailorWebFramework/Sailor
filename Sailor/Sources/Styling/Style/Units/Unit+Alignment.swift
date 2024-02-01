//
//  File.swift
//
//
//  Created by Joshua Davis on 10/5/23.
//

extension Unit {
    public enum Alignment: String, StyleValue, Equatable {
        public var description: String {
            self.rawValue
        }
        
        case normal, stretch, flexStart, flexEnd, start, end, baseline

    }
    
}
