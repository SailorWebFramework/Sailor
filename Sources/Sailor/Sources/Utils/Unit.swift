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
            output += (item as? Double).map(number) ?? item.description
        }
        
        return output
    }

    /// Formats a Double the way CSS expects: `1.0` → "1", `0.5` → "0.5".
    public static func number(_ value: Double) -> String {
        if value.isFinite, value == value.rounded(), abs(value) < 1e15 {
            return String(Int(value))
        }
        return String(value)
    }
    
    public static func when(_ cond: (Bool)?, ret value: String) -> String {
        var output = ""
    
        if let cond = cond, cond {
            output += value
        }
        
        return output
    }
}
