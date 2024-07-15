// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Unit+FirstOrLast.swift
//  

extension Unit {
    public struct FirstOrLast: Equatable, CustomStringConvertible {
        var value: String

        public var description: String {
            self.value
        }

        init(_ value: String) {
            self.value = value
        }

        ///The first line.
        public static var `first`: Self {
            return .init("first")
        }

        ///The last line.
        public static var `last`: Self {
            return .init("last")
        }


    }
}