// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Unit+MixBlendMode.swift
//  

extension Unit {
    public struct MixBlendMode: Equatable, CustomStringConvertible {
        var value: String

        public var description: String {
            self.value
        }

        init(_ value: String) {
            self.value = value
        }

        ///The mix blend mode is normal.
        public static var `normal`: Self {
            return .init("normal")
        }

        ///The mix blend mode is multiply.
        public static var `multiply`: Self {
            return .init("multiply")
        }

        ///The mix blend mode is screen.
        public static var `screen`: Self {
            return .init("screen")
        }

        ///The mix blend mode is overlay.
        public static var `overlay`: Self {
            return .init("overlay")
        }

        ///The mix blend mode is darken.
        public static var `darken`: Self {
            return .init("darken")
        }

        ///The mix blend mode is lighten.
        public static var `lighten`: Self {
            return .init("lighten")
        }

        ///The mix blend mode is color dodge.
        public static var `colorDodge`: Self {
            return .init("color-dodge")
        }

        ///The mix blend mode is color burn.
        public static var `colorBurn`: Self {
            return .init("color-burn")
        }

        ///The mix blend mode is hard light.
        public static var `hardLight`: Self {
            return .init("hard-light")
        }

        ///The mix blend mode is soft light.
        public static var `softLight`: Self {
            return .init("soft-light")
        }

        ///The mix blend mode is difference.
        public static var `difference`: Self {
            return .init("difference")
        }

        ///The mix blend mode is exclusion.
        public static var `exclusion`: Self {
            return .init("exclusion")
        }

        ///The mix blend mode is hue.
        public static var `hue`: Self {
            return .init("hue")
        }

        ///The mix blend mode is saturation.
        public static var `saturation`: Self {
            return .init("saturation")
        }

        ///The mix blend mode is color.
        public static var `color`: Self {
            return .init("color")
        }

        ///The mix blend mode is luminosity.
        public static var `luminosity`: Self {
            return .init("luminosity")
        }

        ///The mix blend mode is plus darker.
        public static var `plusDarker`: Self {
            return .init("plus-darker")
        }

        ///The mix blend mode is plus lighter.
        public static var `plusLighter`: Self {
            return .init("plus-lighter")
        }


    }
}
