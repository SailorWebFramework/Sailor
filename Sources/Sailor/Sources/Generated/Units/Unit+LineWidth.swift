// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Unit+LineWidth.swift
//  

extension Unit {
    public struct LineWidth: Equatable, CustomStringConvertible {
        var value: String

        public var description: String {
            self.value
        }

        init(_ value: String) {
            self.value = value
        }

        ///A thin line.
        public static var `thin`: Self {
            return .init("thin")
        }

        ///A medium line.
        public static var `medium`: Self {
            return .init("medium")
        }

        ///A thick line.
        public static var `thick`: Self {
            return .init("thick")
        }

        ///Defines a number of pixels.
        public static func `px`(_ value: Int) -> Self {
            return .init("\(value)px")
        }

        ///Defines a number of ems.
        public static func `em`(_ value: Int) -> Self {
            return .init("\(value)em")
        }

        ///Defines a number of viewport heights.
        public static func `vh`(_ value: Int) -> Self {
            return .init("\(value)vh")
        }

        ///Defines a number of viewport widths.
        public static func `vw`(_ value: Int) -> Self {
            return .init("\(value)vw")
        }

        ///Defines a number of rems.
        public static func `rem`(_ value: Int) -> Self {
            return .init("\(value)rem")
        }

        ///Defines a number of characters.
        public static func `ch`(_ value: Int) -> Self {
            return .init("\(value)ch")
        }

        ///Defines a number of exs.
        public static func `ex`(_ value: Int) -> Self {
            return .init("\(value)ex")
        }

        ///Defines a number of millimeters.
        public static func `mm`(_ value: Int) -> Self {
            return .init("\(value)mm")
        }

        ///Defines a number of centimeters.
        public static func `cm`(_ value: Int) -> Self {
            return .init("\(value)cm")
        }

        ///Defines a number of inches.
        public static func `in`(_ value: Int) -> Self {
            return .init("\(value)in")
        }

        ///Defines a number of points.
        public static func `pt`(_ value: Int) -> Self {
            return .init("\(value)pt")
        }

        ///Defines a number of picas.
        public static func `pc`(_ value: Int) -> Self {
            return .init("\(value)pc")
        }

        ///Defines a number of viewport minimums.
        public static func `vmin`(_ value: Int) -> Self {
            return .init("\(value)vmin")
        }

        ///Defines a number of viewport maximums.
        public static func `vmax`(_ value: Int) -> Self {
            return .init("\(value)vmax")
        }


    }
}
