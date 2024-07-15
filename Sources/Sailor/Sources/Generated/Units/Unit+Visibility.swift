// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Unit+Visibility.swift
//  

extension Unit {
    public struct Visibility: Equatable, CustomStringConvertible {
        var value: String

        public var description: String {
            self.value
        }

        init(_ value: String) {
            self.value = value
        }

        ///The element is hidden.
        public static var `hidden`: Self {
            return .init("hidden")
        }

        ///The element is visible.
        public static var `visible`: Self {
            return .init("visible")
        }

        ///The element is collapsed.
        public static var `collapse`: Self {
            return .init("collapse")
        }


    }
}
