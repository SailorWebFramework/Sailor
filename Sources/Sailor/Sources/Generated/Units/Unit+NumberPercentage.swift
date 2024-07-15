// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Unit+NumberPercentage.swift
//  

extension Unit {
    public struct NumberPercentage: Equatable, CustomStringConvertible {
        var value: String

        public var description: String {
            self.value
        }

        init(_ value: String) {
            self.value = value
        }

        ///A raw number.
        public static func `number`(_ number: Double) -> Self {
            return .init("\(number)%")
        }

        ///The image is a specific percentage of the element.
        public static func `percent`(_ percent: Int) -> Self {
            return .init("\(percent)%")
        }


    }
}