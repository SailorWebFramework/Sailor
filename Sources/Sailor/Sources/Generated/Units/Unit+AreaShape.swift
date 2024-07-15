// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Unit+AreaShape.swift
//  

extension Unit {
    public struct AreaShape: Equatable, CustomStringConvertible {
        var value: String

        public var description: String {
            self.value
        }

        init(_ value: String) {
            self.value = value
        }

        ///The shape is rectangle.
        public static var `rect`: Self {
            return .init("rect")
        }

        ///The shape is circle.
        public static var `circle`: Self {
            return .init("circle")
        }

        ///The shape is ellipse.
        public static var `ellipse`: Self {
            return .init("ellipse")
        }

        ///The shape is polygon.
        public static var `polygon`: Self {
            return .init("polygon")
        }


    }
}