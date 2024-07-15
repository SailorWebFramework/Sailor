// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Unit+ContentPosition.swift
//  

extension Unit {
    public struct ContentPosition: Equatable, CustomStringConvertible {
        var value: String

        public var description: String {
            self.value
        }

        init(_ value: String) {
            self.value = value
        }

        ///The content is centered.
        public static var `center`: Self {
            return .init("center")
        }

        ///The content is at the start.
        public static var `start`: Self {
            return .init("start")
        }

        ///The content is at the end.
        public static var `end`: Self {
            return .init("end")
        }

        ///The content is at the start.
        public static var `flexStart`: Self {
            return .init("flex-start")
        }

        ///The content is at the end.
        public static var `flexEnd`: Self {
            return .init("flex-end")
        }

        ///The content is at the left.
        public static var `left`: Self {
            return .init("left")
        }

        ///The content is at the right.
        public static var `right`: Self {
            return .init("right")
        }


    }
}
