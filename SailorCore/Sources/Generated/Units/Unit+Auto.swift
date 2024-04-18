// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Unit+Auto.swift
//  
//  Created by Joshua Davis on 10/6/23.
//

extension Unit {
    public struct Auto: Equatable {
        var value: String

        public var description: String {
            self.value
        }

        init(_ value: String) {
            self.value = value
        }

        ///The browser decides the value.
        public static var `auto`: Self {
            return .init("auto")
        }


    }
}
