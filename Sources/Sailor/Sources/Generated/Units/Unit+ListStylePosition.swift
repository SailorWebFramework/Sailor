// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Unit+ListStylePosition.swift
//  

extension Unit {
    public struct ListStylePosition: Equatable, CustomStringConvertible {
        var value: String

        public var description: String {
            self.value
        }

        init(_ value: String) {
            self.value = value
        }

        ///The list style position is inside.
        public static var `inside`: Self {
            return .init("inside")
        }

        ///The list style position is outside.
        public static var `outside`: Self {
            return .init("outside")
        }


    }
}
