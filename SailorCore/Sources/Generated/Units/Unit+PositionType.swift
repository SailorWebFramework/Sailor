// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Unit+PositionType.swift
//  
//  Created by Joshua Davis on 10/6/23.
//

extension Unit {
    public struct PositionType: Equatable {
        var value: String

        public var description: String {
            self.value
        }

        init(_ value: String) {
            self.value = value
        }

        ///The element is static.
        public static var `static`: Self {
            return .init("static")
        }

        ///The element is relative.
        public static var `relative`: Self {
            return .init("relative")
        }

        ///The element is absolute.
        public static var `absolute`: Self {
            return .init("absolute")
        }

        ///The element is fixed.
        public static var `fixed`: Self {
            return .init("fixed")
        }

        ///The element is sticky.
        public static var `sticky`: Self {
            return .init("sticky")
        }

        ///The element is running.
        public static func `running`(_ customIdent: String) -> Self {
            return .init("running(\(customIdent.description))")
        }


    }
}