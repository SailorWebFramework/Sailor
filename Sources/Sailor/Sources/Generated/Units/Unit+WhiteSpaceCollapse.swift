// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Unit+WhiteSpaceCollapse.swift
//  

extension Unit {
    public struct WhiteSpaceCollapse: Equatable, CustomStringConvertible {
        var value: String

        public var description: String {
            self.value
        }

        init(_ value: String) {
            self.value = value
        }

        ///The white space is collapsed.
        public static var `collapse`: Self {
            return .init("collapse")
        }

        ///The white space is preserved.
        public static var `preserve`: Self {
            return .init("preserve")
        }

        ///The white space is discarded.
        public static var `discard`: Self {
            return .init("discard")
        }

        ///The white space is preserved breaks.
        public static var `preserveBreaks`: Self {
            return .init("preserve-breaks")
        }

        ///The white space is preserved spaces.
        public static var `preserveSpaces`: Self {
            return .init("preserve-spaces")
        }

        ///The white space is break spaces.
        public static var `breakSpaces`: Self {
            return .init("break-spaces")
        }


    }
}
