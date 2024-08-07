// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Canvas.swift
//


import Sailboat
import SailorShared

#if os(WASI)
import SailorWeb
#else
// if any other target are created
#endif

extension HTML {
    /// The canvas element provides scripts with a resolution-dependent bitmap canvas, which can be used for rendering graphs, game graphics, or other visual images on the fly.
    public struct Canvas: BodyElement {
        /// name of the html tag associated with this type
        @_spi(Private) public static var name: String { "canvas" }

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


    }
}
// MARK: - Attributes
public extension HTML.Canvas {
    ///The height of the coordinate space in CSS pixels.
    func `height`(_ value: @autoclosure @escaping () -> Int) -> Self {
        attribute(.init(name: "height", value: { value().description }))
    }

    ///The width of the coordinate space in CSS pixels.
    func `width`(_ value: @autoclosure @escaping () -> Int) -> Self {
        attribute(.init(name: "width", value: { value().description }))
    }

}