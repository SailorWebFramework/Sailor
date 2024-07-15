// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Unit+BoxSizing.swift
//  

extension Unit {
    public struct BoxSizing: Equatable, CustomStringConvertible {
        var value: String

        public var description: String {
            self.value
        }

        init(_ value: String) {
            self.value = value
        }

        ///The box sizing is content box.
        public static var `contentBox`: Self {
            return .init("content-box")
        }

        ///The box sizing is border box.
        public static var `borderBox`: Self {
            return .init("border-box")
        }


    }
}