// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Unit+VisualBox.swift
//  

extension Unit {
    public struct VisualBox: Equatable, CustomStringConvertible {
        var value: String

        public var description: String {
            self.value
        }

        init(_ value: String) {
            self.value = value
        }

        ///The border is included in the box.
        public static var `borderBox`: Self {
            return .init("border-box")
        }

        ///The border is not included in the box.
        public static var `contentBox`: Self {
            return .init("content-box")
        }

        ///The padding is included in the box.
        public static var `paddingBox`: Self {
            return .init("padding-box")
        }


    }
}
