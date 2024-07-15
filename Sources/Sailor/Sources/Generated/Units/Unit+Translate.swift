// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Unit+Translate.swift
//  

extension Unit {
    public struct Translate: Equatable, CustomStringConvertible {
        var value: String

        public var description: String {
            self.value
        }

        init(_ value: String) {
            self.value = value
        }

        ///The element is not translated.
        public static var `none`: Self {
            return .init("none")
        }

        ///The translation of the element in the x-axis.
        public static func `translateX`(_ x: Unit.LengthPercentage) -> Self {
            return .init("\(x)")
        }

        ///The translation of the element.
        public static func `translateXy`(_ x: Unit.LengthPercentage, _ y: Unit.LengthPercentage) -> Self {
            return .init("\(x) \(y)")
        }

        ///The translation of the element in the y, x and z axis.
        public static func `translateXyz`(_ x: Unit.LengthPercentage, _ y: Unit.LengthPercentage, _ z: Unit.Length) -> Self {
            return .init("\(x) \(y) \(z)")
        }


    }
}
