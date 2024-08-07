// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Unit+PlaceItems.swift
//  

extension Unit {
    public struct PlaceItems: Equatable, CustomStringConvertible {
        var value: String

        public var description: String {
            self.value
        }

        init(_ value: String) {
            self.value = value
        }

        ///The items are placed with a length.
        public static func `with`(_ alignItems: Unit.AlignItems, _ justifyItems: Unit.JustifyItems? = nil) -> Self {
            return .init("\(alignItems) \(Utils.unwrapUnit(justifyItems))")
        }


    }
}
