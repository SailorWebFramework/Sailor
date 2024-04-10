// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Unit+Direction.swift
//  
//  Created by Joshua Davis on 10/6/23.
//

extension Unit {
    public struct Direction {
        var value: String

        public var description: String {
            self.value
        }

        init(_ value: String) {
            self.value = value
        }

        ///The default value. Defines left to right text rendering.
        public static var `ltr`: Self {
            return .init("ltr")
        }

        ///Defines right to left text rendering.
        public static var `rtl`: Self {
            return .init("rtl")
        }


    }
}
