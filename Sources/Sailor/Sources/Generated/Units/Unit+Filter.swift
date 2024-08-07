// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Unit+Filter.swift
//  

extension Unit {
    public struct Filter: Equatable, CustomStringConvertible {
        var value: String

        public var description: String {
            self.value
        }

        init(_ value: String) {
            self.value = value
        }

        ///No applied filter.
        public static var `none`: Self {
            return .init("none")
        }

        ///Applies a blur to the backdrop.
        public static func `blur`(_ value: Unit.Length) -> Self {
            return .init("blur(\(value))")
        }

        ///Applies a brightness filter to the backdrop.
        public static func `brightness`(_ amount: Double) -> Self {
            return .init("brightness(\(amount))")
        }

        ///Applies a brightness filter to the backdrop.
        public static func `brightness`(_ percent: Percent) -> Self {
            return .init("brightness(\(percent)%)")
        }

        ///Applies a contrast filter to the backdrop.
        public static func `contrast`(_ percent: Percent) -> Self {
            return .init("contrast(\(percent)%)")
        }

        ///Applies a drop shadow to the backdrop.
        public static func `dropShadow`(_ x: Unit.Length, _ y: Unit.Length, _ blur: Unit.Length, _ color: Color) -> Self {
            return .init("drop-shadow(\(x) \(y) \(blur) \(color))")
        }

        ///Applies a gray scale filter to the backdrop.
        public static func `grayscale`(_ percent: Percent) -> Self {
            return .init("grayscale(\(percent)%)")
        }

        ///Applies a hue rotation filter to the backdrop.
        public static func `hueRotate`(_ degrees: Unit.Angle) -> Self {
            return .init("hue-rotate(\(degrees))")
        }

        ///Applies an invert filter to the backdrop.
        public static func `invert`(_ percent: Percent) -> Self {
            return .init("invert(\(percent)%)")
        }

        ///Applies an opacity filter to the backdrop.
        public static func `opacity`(_ percent: Percent) -> Self {
            return .init("opacity(\(percent)%)")
        }

        ///Applies a saturation filter to the backdrop.
        public static func `saturate`(_ percent: Percent) -> Self {
            return .init("saturate(\(percent)%)")
        }

        ///Applies a sepia filter to the backdrop.
        public static func `sepia`(_ percent: Percent) -> Self {
            return .init("sepia(\(percent)%)")
        }

        ///Applies a filter to the backdrop.
        public static func `url`(_ url: String) -> Self {
            return .init("url(\(url))")
        }


    }
}
