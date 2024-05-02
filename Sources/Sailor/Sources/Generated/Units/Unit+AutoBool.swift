// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Unit+AutoBool.swift
//  
//  Created by Joshua Davis on 10/6/23.
//

extension Unit {
    public struct AutoBool: Equatable {
        var value: String

        public var description: String {
            self.value
        }

        init(_ value: String) {
            self.value = value
        }

        ///true value for auto-bool.
        public static var `true`: Self {
            return .init("true")
        }

        ///false value for auto-bool.
        public static var `false`: Self {
            return .init("false")
        }

        ///default behavior of this element on this browser.
        public static var `auto`: Self {
            return .init("auto")
        }


    }
}