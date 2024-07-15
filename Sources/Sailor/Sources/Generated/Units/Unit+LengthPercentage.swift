// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Unit+LengthPercentage.swift
//  

extension Unit {
    public struct LengthPercentage: Equatable, CustomStringConvertible {
        var value: String

        public var description: String {
            self.value
        }

        init(_ value: String) {
            self.value = value
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

        ///The image is a specific percentage of the element.
        public static func `percent`(_ percent: Int) -> Self {
            return .init("\(percent)%")
        }


    }
}
