// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Unit+Normal.swift
//  
//  Created by Joshua Davis on 10/6/23.
//

extension Unit {
    public struct Normal: Equatable {
        var value: String

        public var description: String {
            self.value
        }

        init(_ value: String) {
            self.value = value
        }

        ///The normal value.
        public static var `normal`: Self {
            return .init("normal")
        }


    }
}
