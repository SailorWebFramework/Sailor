// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Unit+HangingPunctuation.swift
//  

extension Unit {
    public struct HangingPunctuation: Equatable, CustomStringConvertible {
        var value: String

        public var description: String {
            self.value
        }

        init(_ value: String) {
            self.value = value
        }

        ///The first line has hanging punctuation.
        public static var `first`: Self {
            return .init("first")
        }

        ///The last line has hanging punctuation.
        public static var `last`: Self {
            return .init("last")
        }


    }
}
