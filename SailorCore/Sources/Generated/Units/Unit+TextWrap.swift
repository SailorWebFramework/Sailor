// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Unit+TextWrap.swift
//  
//  Created by Joshua Davis on 10/6/23.
//

extension Unit {
    public struct TextWrap: Equatable {
        var value: String

        public var description: String {
            self.value
        }

        init(_ value: String) {
            self.value = value
        }

        ///The text is wrapped.
        public static var `hard`: Self {
            return .init("hard")
        }

        ///The text is not wrapped.
        public static var `soft`: Self {
            return .init("soft")
        }

        ///The text is balanced.
        public static var `off`: Self {
            return .init("off")
        }


    }
}