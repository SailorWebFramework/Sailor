// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Meta.swift
//


import Sailboat
import SailorShared

#if os(WASI)
import SailorWeb
#else
// if any other target are created
#endif

extension HTML {
    /// The meta element represents various kinds of metadata that cannot be expressed using the title, base, link, style, and script elements.
    public struct Meta: HeadElement {
        /// name of the html tag associated with this type
        @_spi(Private) public static var name: String { "meta" }

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
public extension HTML.Meta {
    ///Declares the document's character encoding.
    func `charset`(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "charset", value: { value().description }))
    }

    ///The value of the element.
    func `content`(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "content", value: { value().description }))
    }

    ///Indicates that the content is a pragma directive.
    func `httpEquiv`(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "httpEquiv", value: { value().description }))
    }

    ///The name of the metadata.
    func `name`(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "name", value: { value().description }))
    }

}