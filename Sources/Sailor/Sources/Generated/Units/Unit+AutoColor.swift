// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Unit+AutoColor.swift
//  
//  Created by Joshua Davis on 10/6/23.
//

extension Unit {
    public struct AutoColor: Equatable {
        var value: String

        public var description: String {
            self.value
        }

        init(_ value: String) {
            self.value = value
        }

        ///The browser decides the color.
        public static var `auto`: Self {
            return .init("auto")
        }

        ///The color of the element.
        public static func `color`(_ color: Unit.Color) -> Self {
            return .init("color(\(color))")
        }


    }
}
