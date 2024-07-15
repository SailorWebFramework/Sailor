// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Unit+RepeatImage.swift
//  

extension Unit {
    public struct RepeatImage: Equatable, CustomStringConvertible {
        var value: String

        public var description: String {
            self.value
        }

        init(_ value: String) {
            self.value = value
        }

        ///The image is stretched.
        public static var `stretch`: Self {
            return .init("stretch")
        }

        ///The image is repeated.
        public static var `repeat`: Self {
            return .init("repeat")
        }

        ///The image is repeated with rounding.
        public static var `round`: Self {
            return .init("round")
        }

        ///The image is repeated with space.
        public static var `space`: Self {
            return .init("space")
        }


    }
}
