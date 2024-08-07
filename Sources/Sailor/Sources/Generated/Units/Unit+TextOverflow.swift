// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Unit+TextOverflow.swift
//  

extension Unit {
    public struct TextOverflow: Equatable, CustomStringConvertible {
        var value: String

        public var description: String {
            self.value
        }

        init(_ value: String) {
            self.value = value
        }

        ///
        public static var `clip`: Self {
            return .init("clip")
        }

        ///
        public static var `elipsis`: Self {
            return .init("elipsis")
        }


    }
}
