// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Unit+DirectionBreak.swift
//  

extension Unit {
    public struct DirectionBreak: Equatable, CustomStringConvertible {
        var value: String

        public var description: String {
            self.value
        }

        init(_ value: String) {
            self.value = value
        }

        ///The break is sliced.
        public static var `slice`: Self {
            return .init("slice")
        }

        ///The break is cloned.
        public static var `clone`: Self {
            return .init("clone")
        }


    }
}
