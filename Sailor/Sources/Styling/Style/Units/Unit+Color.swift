//
//  File.swift
//
//
//  Created by Joshua Davis on 10/5/23.
//

extension Unit {
    public enum Color: StyleValue, Equatable {
        public static func == (lhs: Unit.Color, rhs: Unit.Color) -> Bool {
            lhs.description == rhs.description
        }
        
        public func hash(into hasher: inout Hasher) {
            hasher.combine(description)
        }
        
        public var description: String {
            switch self {
            case .hex(let hexcode):
                return hexcode
            case .rgb(let r, let g, let b):
                return "rgb(\(r) \(g) \(b))"
            case .rgba(let r, let g, let b, let a):
                return "rgb(\(r) \(g) \(b) / \(a))"
            case .hsl(let h, let s, let l):
                return "hsl(\(h) \(s) \(l))"
            case .hsla(let h, let s, let l, let a):
                return "hsl(\(h) \(s) \(l) \(a))"
            case .empty:
                return ""
            }
        }
        
        case empty
        case hex(String)
        case rgb(any ColorValue, any ColorValue, any ColorValue)
        case rgba(Int, Int, Int, Double)
        case hsl(Int, Int, Int)
        case hsla(Int, Int, Int, Double)

    }
    
}

public protocol ColorValue { }

extension Int: ColorValue {}

//extension Double: ColorValue {}

public struct Percent: ColorValue, Hashable, CustomStringConvertible {
    internal let value: Int
    
    public var description: String {
        "\(value)%"
    }
    
    public init(_ value: Int) {
        self.value = value
    }
}
