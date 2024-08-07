// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Img.swift
//


import Sailboat
import SailorShared

#if os(WASI)
import SailorWeb
#else
// if any other target are created
#endif

extension HTML {
    /// The img element represents an image.
    public struct Img: BodyElement {
        /// name of the html tag associated with this type
        @_spi(Private) public static var name: String { "img" }

        /// attributes associated with this type
        @_spi(Private) public var attributes: [String: () -> any AttributeValue]

        /// events associated with this type
        @_spi(Private) public var events: [String: (EventResult) -> Void]

        /// content that is contained by this html element
        @_spi(Private) public var content: () -> any Fragment

        /// renderer that is used to render this element
        @_spi(Private) public var renderer: any Renderable

        @_spi(Private)
        public var body: Never {
            .error()
        }
        
        internal init(bodyValue: (() -> any Fragment)?) {
            self.attributes = [:]
            self.events = [:]
            self.content = bodyValue ?? { List() }
            #if os(WASI)
            self.renderer = JSNode(named: Self.name)
            #else
            self.renderer = EmptyRenderer()
            #endif
        }

        public init() {  
            self.init(bodyValue: nil)
        }

        public init(src: @autoclosure @escaping () -> String) {
            self.init(bodyValue: nil)

            self.attributes["src"] = { src().description }
        }


    }
}
// MARK: - Attributes
public extension HTML.Img {
    ///The alternative text for the image.
    func `alt`(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "alt", value: { value().description }))
    }

    ///How the element handles cross-origin requests.
    func `crossorigin`(_ value: @autoclosure @escaping () -> Unit.CrossOrigin) -> Self {
        attribute(.init(name: "crossorigin", value: { value().description }))
    }

    ///The intrinsic height of the image in pixels.
    func `height`(_ value: @autoclosure @escaping () -> Int) -> Self {
        attribute(.init(name: "height", value: { value().description }))
    }

    ///Indicates that the image is part of a server-side image map.
    func `ismap`(_ value: @autoclosure @escaping () -> Bool) -> Self {
        attribute(.init(name: "ismap", value: { value().description }))
    }

    ///Indicates how the browser should load the image.
    func `loading`(_ value: @autoclosure @escaping () -> Unit.Loading) -> Self {
        attribute(.init(name: "loading", value: { value().description }))
    }

    ///Specifies which referrer information to send when fetching the image.
    func `referrerpolicy`(_ value: @autoclosure @escaping () -> Unit.ReferrerPolicy) -> Self {
        attribute(.init(name: "referrerpolicy", value: { value().description }))
    }

    ///The sizes attribute gives the sizes of the icons for visual media.
    func `sizes`(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "sizes", value: { value().description }))
    }

    ///The URL of the image.
    func `src`(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "src", value: { value().description }))
    }

    ///A list of one or more strings separated by commas indicating a set of possible images to use for the source.
    func `srcset`(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "srcset", value: { value().description }))
    }

    ///The URL of the image map to use.
    func `usemap`(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "usemap", value: { value().description }))
    }

    ///The intrinsic width of the image in pixels.
    func `width`(_ value: @autoclosure @escaping () -> Int) -> Self {
        attribute(.init(name: "width", value: { value().description }))
    }

}