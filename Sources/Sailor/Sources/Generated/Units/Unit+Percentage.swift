// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Unit+Percentage.swift
//  

extension Unit {
    public struct Percentage: Equatable, CustomStringConvertible {
        var value: String

        public var description: String {
            self.value
        }

        init(_ value: String) {
            self.value = value
        }

        ///The image is a specific percentage of the element.
        public static func `percent`(_ percent: Int) -> Self {
            return .init("\(percent)%")
        }


    }
}
