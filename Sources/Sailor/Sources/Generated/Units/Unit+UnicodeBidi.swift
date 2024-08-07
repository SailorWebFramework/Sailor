// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Unit+UnicodeBidi.swift
//  

extension Unit {
    public struct UnicodeBidi: Equatable, CustomStringConvertible {
        var value: String

        public var description: String {
            self.value
        }

        init(_ value: String) {
            self.value = value
        }

        ///The element is normal.
        public static var `normal`: Self {
            return .init("normal")
        }

        ///The element is embedded.
        public static var `embed`: Self {
            return .init("embed")
        }

        ///The element is isolated.
        public static var `isolate`: Self {
            return .init("isolate")
        }

        ///The element is bidi override.
        public static var `bidiOverride`: Self {
            return .init("bidi-override")
        }

        ///The element is isolated override.
        public static var `isolateOverride`: Self {
            return .init("isolate-override")
        }

        ///The element is plaintext.
        public static var `plaintext`: Self {
            return .init("plaintext")
        }


    }
}
