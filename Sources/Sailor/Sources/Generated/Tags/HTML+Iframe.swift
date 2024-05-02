// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Iframe.swift
//
//  Created by Joshua Davis.
//

import Sailboat
import SailorShared

#if os(WASI)
import SailorWeb
#else
// if any other target are created
#endif

extension HTML {
    /// The iframe element represents a nested browsing context, effectively embedding another HTML page into the current page.
    public struct Iframe: BodyElement {
        /// name of the html tag associated with this type
        @_spi(Private) public static var name: String { "iframe" }

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
public extension HTML.Iframe {
    ///A set of values that controls the sandboxing of the iframe.
    func `allow`(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "allow", value: { value().description }))
    }

    ///Whether the iframe can activate fullscreen mode.
    func `allowfullscreen`(_ value: @autoclosure @escaping () -> Bool) -> Self {
        attribute(.init(name: "allowfullscreen", value: { value().description }))
    }

    ///The height of the iframe's embedded content area.
    func `height`(_ value: @autoclosure @escaping () -> Int) -> Self {
        attribute(.init(name: "height", value: { value().description }))
    }

    ///A name for the nested browsing context.
    func `name`(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "name", value: { value().description }))
    }

    ///Specifies which referrer information to send when fetching the iframe's resource.
    func `referrerpolicy`(_ value: @autoclosure @escaping () -> Unit.ReferrerPolicy) -> Self {
        attribute(.init(name: "referrerpolicy", value: { value().description }))
    }

    ///A set of values that controls the features to enable and disable within the iframe.
    func `sandbox`(_ value: @autoclosure @escaping () -> Unit.Sandbox) -> Self {
        attribute(.init(name: "sandbox", value: { value().description }))
    }

    ///The URL of the page to embed.
    func `src`(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "src", value: { value().description }))
    }

    ///A static HTML content to embed.
    func `srcdoc`(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "srcdoc", value: { value().description }))
    }

    ///The width of the iframe's embedded content area.
    func `width`(_ value: @autoclosure @escaping () -> Int) -> Self {
        attribute(.init(name: "width", value: { value().description }))
    }

}