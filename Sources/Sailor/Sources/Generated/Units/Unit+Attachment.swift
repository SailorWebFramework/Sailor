// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Unit+Attachment.swift
//  

extension Unit {
    public struct Attachment: Equatable, CustomStringConvertible {
        var value: String

        public var description: String {
            self.value
        }

        init(_ value: String) {
            self.value = value
        }

        ///The background is fixed.
        public static var `fixed`: Self {
            return .init("fixed")
        }

        ///The background is local.
        public static var `local`: Self {
            return .init("local")
        }

        ///The background scrolls with the content.
        public static var `scroll`: Self {
            return .init("scroll")
        }


    }
}
