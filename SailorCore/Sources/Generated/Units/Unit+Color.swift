// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Unit+Color.swift
//  
//  Created by Joshua Davis on 10/6/23.
//

extension Unit {
    public struct Color {
        var value: String

        public var description: String {
            self.value
        }

        init(_ value: String) {
            self.value = value
        }

        ///Defines a color in hexadecimal format.
        public static func `hex`(_ hex: String) -> Self {
            return .init("\(hex)")
        }

        ///Defines an RGB color.
        public static func `rgb`(_ r: Int, _ g: Int, _ b: Int) -> Self {
            return .init("rgb(\(r) \(g) \(b))")
        }

        ///Defines an RGBA color.
        public static func `rgba`(_ r: Int, _ g: Int, _ b: Int, _ a: Double) -> Self {
            return .init("rgba(\(r) \(g) \(b) \(a))")
        }

        ///Defines an HSL color.
        public static func `hsl`(_ h: Int, _ s: Percent, _ l: Percent) -> Self {
            return .init("hsl(\(h) \(s)% \(l)%)")
        }

        ///Defines an HSLA color.
        public static func `hsla`(_ h: Int, _ s: Percent, _ l: Percent, _ a: Double) -> Self {
            return .init("hsla(\(h) \(s)% \(l)% \(a))")
        }


    }
}
