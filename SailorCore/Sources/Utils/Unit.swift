//
//  Unit.swift
//  
//
//  Created by Joshua Davis on 10/6/23.
//

/// Umbrella for all attributes+style units
public enum Unit { }


// TODO: do i put description with percent?
public struct Percent: CustomStringConvertible, Equatable {
    public var description: String {
        "\(self.value)" //         "\(self.value)%"
    }
    
    var value: Int
    
//    init(_ value: Double) {
//        self.value = value
//    }
    
    public init(_ value: Int) {
        self.value = value
    }
}
