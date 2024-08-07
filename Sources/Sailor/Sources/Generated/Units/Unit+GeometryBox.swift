// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Unit+GeometryBox.swift
//  

extension Unit {
    public struct GeometryBox: Equatable, CustomStringConvertible {
        var value: String

        public var description: String {
            self.value
        }

        init(_ value: String) {
            self.value = value
        }

        ///The geometry box is the fill box.
        public static var `fillBox`: Self {
            return .init("fill-box")
        }

        ///The geometry box is the stroke box.
        public static var `strokeBox`: Self {
            return .init("stroke-box")
        }

        ///The geometry box is the view box.
        public static var `viewBox`: Self {
            return .init("view-box")
        }

        ///The geometry box is the content box.
        public static var `contentBox`: Self {
            return .init("content-box")
        }

        ///The geometry box is the padding box.
        public static var `paddingBox`: Self {
            return .init("padding-box")
        }

        ///The geometry box is the border box.
        public static var `borderBox`: Self {
            return .init("border-box")
        }


    }
}
