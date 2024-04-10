// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Unit+ImageSource.swift
//  
//  Created by Joshua Davis on 10/6/23.
//

extension Unit {
    public struct ImageSource {
        var value: String

        public var description: String {
            self.value
        }

        init(_ value: String) {
            self.value = value
        }

        ///A URL image source.
        public static func `url`(_ url: String) -> Self {
            return .init("url(\(url.description))")
        }

        ///A source image.
        public static func `src`(_ src: String) -> Self {
            return .init("src(\(src.description))")
        }

        ///A linear gradient.
        public static func `linear`(_ angle: Unit.Angle) -> Self {
            return .init("linear-gradient(\(angle.description))")
        }

        ///A radial gradient.
        public static func `radial`(_ shape: Unit.Length, _ size: Unit.Length, _ position: Unit.Length, _ shape2: Unit.Length, _ size2: Unit.Length, _ position2: Unit.Length) -> Self {
            return .init("radial-gradient(\(shape.description) \(size.description) at \(position.description), \(shape2.description) \(size2.description) at \(position2.description))")
        }


    }
}
