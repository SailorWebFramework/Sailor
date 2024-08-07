// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Unit+Integer.swift
//  

extension Unit {
    public struct Integer: Equatable, CustomStringConvertible {
        var value: String

        public var description: String {
            self.value
        }

        init(_ value: String) {
            self.value = value
        }

        ///A raw integer.
        public static func `int`(_ int: Int) -> Self {
            return .init("{{number}}%")
        }


    }
}
