// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Unit+LineStyle.swift
//  
//  Created by Joshua Davis on 10/6/23.
//

extension Unit {
    public struct LineStyle: Equatable {
        var value: String

        public var description: String {
            self.value
        }

        init(_ value: String) {
            self.value = value
        }

        ///No line.
        public static var `none`: Self {
            return .init("none")
        }

        ///A hidden line.
        public static var `hidden`: Self {
            return .init("hidden")
        }

        ///A dotted line.
        public static var `dotted`: Self {
            return .init("dotted")
        }

        ///A dashed line.
        public static var `dashed`: Self {
            return .init("dashed")
        }

        ///A solid line.
        public static var `solid`: Self {
            return .init("solid")
        }

        ///A double line.
        public static var `double`: Self {
            return .init("double")
        }

        ///A grooved line.
        public static var `groove`: Self {
            return .init("groove")
        }

        ///A ridged line.
        public static var `ridge`: Self {
            return .init("ridge")
        }

        ///An inset line.
        public static var `inset`: Self {
            return .init("inset")
        }

        ///An outset line.
        public static var `outset`: Self {
            return .init("outset")
        }


    }
}
