//
//  File.swift
//
//
//  Created by Joshua Davis on 10/5/23.
//

import Foundation

extension Unit {
    public enum Color: CSSValue, AttributeValue, Equatable {
        case empty
        case hex(String)
        case rgb(Int, Int, Int)
        case rgba(Int, Int, Int, Double)
        case hsl(Int, Int, Int)
        case hsla(Int, Int, Int, Double)
        
        // TODO: rename to build
        public func render() -> String {
            switch self {
            case .hex(let hexcode):
                return hexcode
            case .rgb(let r, let g, let b):
                return "rgb(\(r), \(g), \(b))"
            case .rgba(let r, let g, let b, let a):
                return "rgb(\(r), \(g), \(b), \(a))"
            case .hsl(let h, let s, let l):
                return "hsl(\(h), \(s)%, \(l)%)"
            case .hsla(let h, let s, let l, let a):
                return "hsl(\(h), \(s)%, \(l)%, \(a))"
            case .empty:
                return ""
            }
        }

    }
    
}
