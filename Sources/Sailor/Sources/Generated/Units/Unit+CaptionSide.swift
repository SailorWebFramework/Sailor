// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Unit+CaptionSide.swift
//  

extension Unit {
    public struct CaptionSide: Equatable, CustomStringConvertible {
        var value: String

        public var description: String {
            self.value
        }

        init(_ value: String) {
            self.value = value
        }

        ///The caption is on top.
        public static var `top`: Self {
            return .init("top")
        }

        ///The caption is on bottom.
        public static var `bottom`: Self {
            return .init("bottom")
        }


    }
}
