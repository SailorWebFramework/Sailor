// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Unit+ColumnFill.swift
//  
//  Created by Joshua Davis on 10/6/23.
//

extension Unit {
    public struct ColumnFill {
        var value: String

        public var description: String {
            self.value
        }

        init(_ value: String) {
            self.value = value
        }

        ///The browser decides the column fill.
        public static var `auto`: Self {
            return .init("auto")
        }

        ///The column fill is balanced.
        public static var `balance`: Self {
            return .init("balance")
        }

        ///The column fill is balanced all.
        public static var `balanceAll`: Self {
            return .init("balance-all")
        }


    }
}
