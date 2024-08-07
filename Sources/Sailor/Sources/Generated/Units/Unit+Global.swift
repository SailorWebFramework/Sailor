// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Unit+Global.swift
//  

extension Unit {
    public struct Global: Equatable, CustomStringConvertible {
        var value: String

        public var description: String {
            self.value
        }

        init(_ value: String) {
            self.value = value
        }

        ///Specifies that all the element's properties should be changed to their initial values.
        public static var `initial`: Self {
            return .init("initial")
        }

        ///Specifies that all the element's properties should be changed to their inherited values.
        public static var `inherit`: Self {
            return .init("inherit")
        }

        ///Reverts the filter to the parent.
        public static var `revert`: Self {
            return .init("revert")
        }

        ///Specifies that all the element's properties should roll back the cascade to a previous cascade layer, if one exists. If no other cascade layer exists, the element's properties will roll back to the matching rule, if one exists, in the current layer or to a previous style origin.
        public static var `revertLayer`: Self {
            return .init("revert-layer")
        }

        ///Specifies that all the element's properties should be changed to their inherited values if they inherit by default, or to their initial values if not.
        public static var `unset`: Self {
            return .init("unset")
        }


    }
}
