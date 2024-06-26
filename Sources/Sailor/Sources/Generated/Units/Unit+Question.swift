// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Unit+Question.swift
//  
//  Created by Joshua Davis on 10/6/23.
//

extension Unit {
    public struct Question: Equatable {
        var value: String

        public var description: String {
            self.value
        }

        init(_ value: String) {
            self.value = value
        }

        ///The answer is yes.
        public static var `yes`: Self {
            return .init("yes")
        }

        ///The answer is no.
        public static var `no`: Self {
            return .init("no")
        }


    }
}
