// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Unit+AllOrNone.swift
//  
//  Created by Joshua Davis on 10/6/23.
//

extension Unit {
    public struct AllOrNone {
        var value: String

        public var description: String {
            self.value
        }

        init(_ value: String) {
            self.value = value
        }

        ///All elements are affected.
        public static var `all`: Self {
            return .init("all")
        }

        ///No elements are affected.
        public static var `none`: Self {
            return .init("none")
        }


    }
}