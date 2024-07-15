// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Unit+JustifySelf.swift
//  

extension Unit {
    public struct JustifySelf: Equatable, CustomStringConvertible {
        var value: String

        public var description: String {
            self.value
        }

        init(_ value: String) {
            self.value = value
        }

        ///The self is auto.
        public static var `auto`: Self {
            return .init("auto")
        }

        ///The items are normal.
        public static var `normal`: Self {
            return .init("normal")
        }

        ///The items are aligned to the baseline.
        public static var `baseline`: Self {
            return .init("baseline")
        }

        ///The items are legacy.
        public static var `legacy`: Self {
            return .init("legacy")
        }

        ///The items are legacy.
        public static func `legacy`(_ position: Unit.OPLCR) -> Self {
            return .init("legacy \(position)")
        }

        ///The items are stretched.
        public static var `stretch`: Self {
            return .init("stretch")
        }

        ///The items are aligned to the baseline.
        public static func `baseline`(_ order: Unit.FirstOrLast) -> Self {
            return .init("\(order) baseline")
        }

        ///The items are justified with a length.
        public static func `with`(_ contentSafety: Unit.ContentSafety, _ contentPosition: Unit.ItemsPosition) -> Self {
            return .init("\(contentSafety) \(contentPosition)")
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