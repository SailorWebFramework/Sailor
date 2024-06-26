// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Unit+Length.swift
//  
//  Created by Joshua Davis on 10/6/23.
//

extension Unit {
    public struct Length: Equatable {
        var value: String

        public var description: String {
            self.value
        }

        init(_ value: String) {
            self.value = value
        }

        ///Defines a number of pixels.
        public static func `px`(_ value: Int) -> Self {
            return .init("\(value.description)px")
        }

        ///Defines a number of ems.
        public static func `em`(_ value: Int) -> Self {
            return .init("\(value.description)em")
        }

        ///Defines a number of viewport heights.
        public static func `vh`(_ value: Int) -> Self {
            return .init("\(value.description)vh")
        }

        ///Defines a number of viewport widths.
        public static func `vw`(_ value: Int) -> Self {
            return .init("\(value.description)vw")
        }

        ///Defines a number of rems.
        public static func `rem`(_ value: Int) -> Self {
            return .init("\(value.description)rem")
        }

        ///Defines a number of characters.
        public static func `ch`(_ value: Int) -> Self {
            return .init("\(value.description)ch")
        }

        ///Defines a number of exs.
        public static func `ex`(_ value: Int) -> Self {
            return .init("\(value.description)ex")
        }

        ///Defines a number of millimeters.
        public static func `mm`(_ value: Int) -> Self {
            return .init("\(value.description)mm")
        }

        ///Defines a number of centimeters.
        public static func `cm`(_ value: Int) -> Self {
            return .init("\(value.description)cm")
        }

        ///Defines a number of inches.
        public static func `in`(_ value: Int) -> Self {
            return .init("\(value.description)in")
        }

        ///Defines a number of points.
        public static func `pt`(_ value: Int) -> Self {
            return .init("\(value.description)pt")
        }

        ///Defines a number of picas.
        public static func `pc`(_ value: Int) -> Self {
            return .init("\(value.description)pc")
        }

        ///Defines a number of viewport minimums.
        public static func `vmin`(_ value: Int) -> Self {
            return .init("\(value.description)vmin")
        }

        ///Defines a number of viewport maximums.
        public static func `vmax`(_ value: Int) -> Self {
            return .init("\(value.description)vmax")
        }


    }
}
