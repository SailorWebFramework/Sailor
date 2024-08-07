// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Unit+OverflowClipMargin.swift
//  

extension Unit {
    public struct OverflowClipMargin: Equatable, CustomStringConvertible {
        var value: String

        public var description: String {
            self.value
        }

        init(_ value: String) {
            self.value = value
        }

        ///The overflow clip margin is a box.
        public static func `box`(_ box: Unit.VisualBox) -> Self {
            return .init("\(box)")
        }

        ///The overflow clip margin is a length.
        public static func `length`(_ length: Unit.Length) -> Self {
            return .init("\(length)")
        }


    }
}
