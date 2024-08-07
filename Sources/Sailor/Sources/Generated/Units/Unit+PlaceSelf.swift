// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Unit+PlaceSelf.swift
//  

extension Unit {
    public struct PlaceSelf: Equatable, CustomStringConvertible {
        var value: String

        public var description: String {
            self.value
        }

        init(_ value: String) {
            self.value = value
        }

        ///The self is placed with a length.
        public static func `with`(_ alignSelf: Unit.AlignSelf, _ justifySelf: Unit.JustifySelf? = nil) -> Self {
            return .init("\(alignSelf) \(Utils.unwrapUnit(justifySelf))")
        }


    }
}
