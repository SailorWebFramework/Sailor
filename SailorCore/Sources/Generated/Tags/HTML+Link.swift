// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Link.swift
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
    /// The link element allows authors to link their document to other resources.
    public struct Link: HeadElement {
        /// name of the html tag associated with this type
        @_spi(Private) public static var name: String { "link" }

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

        public init(rel: @autoclosure @escaping () -> String, href: @autoclosure @escaping () -> String) {
            self.init(bodyValue: nil)

            self.attributes["rel"] = { rel().description }
            self.attributes["href"] = { href().description }
        }


    }
}
// MARK: - Attributes
public extension HTML.Link {
    ///The URL of the link.
    func `href`(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "href", value: { value().description }))
    }

    ///How the element handles cross-origin requests.
    func `crossorigin`(_ value: @autoclosure @escaping () -> Unit.CrossOrigin) -> Self {
        attribute(.init(name: "crossorigin", value: { value().description }))
    }

    ///Specifies the language of the linked document.
    func `hreflang`(_ value: @autoclosure @escaping () -> Unit.Language) -> Self {
        attribute(.init(name: "hreflang", value: { value().description }))
    }

    ///Specifies what media/device the linked document is optimized for.
    func `media`(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "media", value: { value().description }))
    }

    ///Specifies which referrer information to send when fetching the linked resource.
    func `referrerpolicy`(_ value: @autoclosure @escaping () -> Unit.ReferrerPolicy) -> Self {
        attribute(.init(name: "referrerpolicy", value: { value().description }))
    }

    ///Specifies the relationship between the current document and the linked document.
    func `rel`(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "rel", value: { value().description }))
    }

    ///The sizes attribute gives the sizes of the icons for visual media.
    func `sizes`(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "sizes", value: { value().description }))
    }

    ///Specifies the media type of the linked document.
    func `type`(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "type", value: { value().description }))
    }

}