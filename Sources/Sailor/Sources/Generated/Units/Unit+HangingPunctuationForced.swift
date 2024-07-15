// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Unit+HangingPunctuationForced.swift
//  

extension Unit {
    public struct HangingPunctuationForced: Equatable, CustomStringConvertible {
        var value: String

        public var description: String {
            self.value
        }

        init(_ value: String) {
            self.value = value
        }

        ///The last line has hanging punctuation.
        public static var `forceEnd`: Self {
            return .init("force-end")
        }

        ///The last line has hanging punctuation.
        public static var `allowEnd`: Self {
            return .init("allow-end")
        }


    }
}
