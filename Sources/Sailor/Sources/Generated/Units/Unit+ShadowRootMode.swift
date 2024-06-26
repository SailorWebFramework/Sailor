// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Unit+ShadowRootMode.swift
//  
//  Created by Joshua Davis on 10/6/23.
//

extension Unit {
    public struct ShadowRootMode: Equatable {
        var value: String

        public var description: String {
            self.value
        }

        init(_ value: String) {
            self.value = value
        }

        ///The shadow root is open.
        public static var `open`: Self {
            return .init("open")
        }

        ///The shadow root is closed.
        public static var `closed`: Self {
            return .init("closed")
        }


    }
}
