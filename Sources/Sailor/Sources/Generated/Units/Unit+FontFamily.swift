// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Unit+FontFamily.swift
//  

extension Unit {
    public struct FontFamily: Equatable, CustomStringConvertible {
        var value: String

        public var description: String {
            self.value
        }

        init(_ value: String) {
            self.value = value
        }

        ///The element is named.
        public static func `named`(_ name: String) -> Self {
            return .init("\(name)")
        }

        ///The element is named.
        public static func `customIdent`(_ ident: String) -> Self {
            return .init("\(ident)")
        }

        ///The element is named.
        public static func `generic`(_ name: String) -> Self {
            return .init("generic(\(name))")
        }


    }
}
