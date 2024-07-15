//
//  Unit.swift
//  
//
//  Created by Joshua Davis on 10/6/23.
//

/// Units used as values for CSS properties
public enum PropUnit { }

/// Umbrella for all attributes+style units
public enum Unit { }

//public typealias Percent = Int

// TODO: remove?
// TODO: do i put description with percent?

//public typealias Percent = Double
public struct Percent: CustomStringConvertible, Equatable {
    public var description: String {
        "\(self.value)" //         "\(self.value)%"
    }
    
    var value: Int
    
//    init(_ value: Double) {
//        self.value = Int(value * 100)
//    }
    
    public init(_ value: Int) {
        self.value = value
    }
}

enum Utils {
    public static func unwrapUnit(_ item: (any CustomStringConvertible)?) -> String {
        var output = ""
    
        if let item = item {
            output += item.description
        }
        
        return output
    }
    
    public static func when(_ cond: (Bool)?, ret value: String) -> String {
        var output = ""
    
        if let cond = cond, cond {
            output += value
        }
        
        return output
    }
}
