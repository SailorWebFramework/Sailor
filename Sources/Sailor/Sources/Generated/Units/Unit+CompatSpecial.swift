// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Unit+CompatSpecial.swift
//  
//  Created by Joshua Davis on 10/6/23.
//

extension Unit {
    public struct CompatSpecial: Equatable {
        var value: String

        public var description: String {
            self.value
        }

        init(_ value: String) {
            self.value = value
        }

        ///The element is not special.
        public static var `textfield`: Self {
            return .init("textfield")
        }

        ///The element is a button.
        public static var `menulistButton`: Self {
            return .init("menulist-button")
        }


    }
}
