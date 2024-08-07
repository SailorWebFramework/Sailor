// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Unit+TextTrackKind.swift
//  

extension Unit {
    public struct TextTrackKind: Equatable, CustomStringConvertible {
        var value: String

        public var description: String {
            self.value
        }

        init(_ value: String) {
            self.value = value
        }

        ///The text track is subtitles.
        public static var `subtitles`: Self {
            return .init("subtitles")
        }

        ///The text track is captions.
        public static var `captions`: Self {
            return .init("captions")
        }

        ///The text track is descriptions.
        public static var `descriptions`: Self {
            return .init("descriptions")
        }

        ///The text track is chapters.
        public static var `chapters`: Self {
            return .init("chapters")
        }

        ///The text track is metadata.
        public static var `metadata`: Self {
            return .init("metadata")
        }


    }
}
