// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Unit+Percentage.swift
//  
//  Created by Joshua Davis on 10/6/23.
//

extension Unit {
    public struct Percentage: Equatable {
        var value: String

        public var description: String {
            self.value
        }

        init(_ value: String) {
            self.value = value
        }

        ///The image is a specific percentage of the element.
        public static func `percent`(_ percent: Int) -> Self {
            return .init("\(percent.description)%")
        }


    }
}