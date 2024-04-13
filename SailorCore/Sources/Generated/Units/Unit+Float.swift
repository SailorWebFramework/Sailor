// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Unit+Float.swift
//  
//  Created by Joshua Davis on 10/6/23.
//

extension Unit {
    public struct Float: Equatable {
        var value: String

        public var description: String {
            self.value
        }

        init(_ value: String) {
            self.value = value
        }

        ///The element is floated to the left.
        public static var `left`: Self {
            return .init("left")
        }

        ///The element is floated to the right.
        public static var `right`: Self {
            return .init("right")
        }

        ///The element is not floated.
        public static var `none`: Self {
            return .init("none")
        }

        ///The element is floated to the inline start.
        public static var `inlineStart`: Self {
            return .init("inline-start")
        }

        ///The element is floated to the inline end.
        public static var `inlineEnd`: Self {
            return .init("inline-end")
        }

        ///The element is floated to the block start.
        public static var `blockStart`: Self {
            return .init("block-start")
        }

        ///The element is floated to the block end.
        public static var `blockEnd`: Self {
            return .init("block-end")
        }

        ///The element is floated with a snap block.
        public static var `snapBlock`: Self {
            return .init("snap-block")
        }

        ///The element is floated with a snap block.
        public static func `snapBlock`(_ length: Unit.Length, _ offset: Unit.Location? = nil) -> Self {
            return .init("snap-block(\(length.description)\(offset != nil ? ", \(offset!.description)" : ""))")
        }

        ///The element is floated with a snap inline.
        public static var `snapInline`: Self {
            return .init("snap-inline")
        }

        ///The element is floated with a snap inline.
        public static func `snapInline`(_ length: Unit.Length, _ offset: Unit.Location? = nil) -> Self {
            return .init("snap-inline(\(length.description)\(offset != nil ? ", \(offset!.description)" : ""))")
        }

        ///The element is floated to the top.
        public static var `top`: Self {
            return .init("top")
        }

        ///The element is floated to the bottom.
        public static var `bottom`: Self {
            return .init("bottom")
        }

        ///The element is floated as a footnote.
        public static var `footnote`: Self {
            return .init("footnote")
        }


    }
}