// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Unit+AutoInt.swift
//  

extension Unit {
    public struct AutoInt: Equatable, CustomStringConvertible {
        var value: String

        public var description: String {
            self.value
        }

        init(_ value: String) {
            self.value = value
        }

        ///The browser decides the integer.
        public static var `auto`: Self {
            return .init("auto")
        }

        ///A raw integer.
        public static func `int`(_ int: Int) -> Self {
            return .init("{{number}}%")
        }


    }
}
