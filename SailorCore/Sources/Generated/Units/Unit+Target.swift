// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Unit+Target.swift
//  
//  Created by Joshua Davis on 10/6/23.
//

extension Unit {
    public struct Target {
        var value: String

        public var description: String {
            self.value
        }

        init(_ value: String) {
            self.value = value
        }

        ///Opens the link in a new window or tab.
        public static var `blank`: Self {
            return .init("_blank")
        }

        ///Opens the link in the same frame as it was clicked.
        public static var `self`: Self {
            return .init("_self")
        }

        ///Opens the link in the parent frame.
        public static var `parent`: Self {
            return .init("_parent")
        }

        ///Opens the link in the full body of the window.
        public static var `top`: Self {
            return .init("_top")
        }


    }
}
