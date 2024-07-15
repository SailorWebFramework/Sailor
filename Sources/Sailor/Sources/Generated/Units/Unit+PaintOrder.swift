// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Unit+PaintOrder.swift
//  

extension Unit {
    public struct PaintOrder: Equatable, CustomStringConvertible {
        var value: String

        public var description: String {
            self.value
        }

        init(_ value: String) {
            self.value = value
        }

        ///The paint order is normal.
        public static var `normal`: Self {
            return .init("normal")
        }

        ///The paint order is fill.
        public static var `fill`: Self {
            return .init("fill")
        }

        ///The paint order is stroke.
        public static var `stroke`: Self {
            return .init("stroke")
        }

        ///The paint order is markers.
        public static var `markers`: Self {
            return .init("markers")
        }

        ///The paint order is custom.
        public static func `with`(fill: Bool? = nil, stroke: Bool? = nil, markers: Bool? = nil) -> Self {
            return .init("\(Utils.when(fill, ret: "fill")) \(Utils.when(stroke, ret: "stroke")) \(Utils.when(markers, ret: "markers"))")
        }


    }
}