// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Map.swift
//


import Sailboat
import SailorShared

#if os(WASI)
import SailorWeb
#else
// if any other target are created
#endif

extension HTML {
    /// The map element, in conjunction with an img element and any area element descendants, defines an image map.
    public struct Map: BodyElement {
        /// name of the html tag associated with this type
        @_spi(Private) public static var name: String { "map" }

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

        public init(@PageBuilder _ content: @escaping () -> any Fragment) {
            self.init(bodyValue: content)
        }


    }
}
// MARK: - Attributes
public extension HTML.Map {
    ///The name of the map element.
    func `name`(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "name", value: { value().description }))
    }

}