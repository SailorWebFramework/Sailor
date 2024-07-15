// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Ins.swift
//


import Sailboat
import SailorShared

#if os(WASI)
import SailorWeb
#else
// if any other target are created
#endif

extension HTML {
    /// The ins element represents a range of text that has been added to a document.
    public struct Ins: BodyElement {
        /// name of the html tag associated with this type
        @_spi(Private) public static var name: String { "ins" }

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

        public init(_ text: @autoclosure @escaping () -> String) {
            self.init(bodyValue: { List([text()], hash: "") } )
        }

        public init(@PageBuilder _ content: @escaping () -> any Fragment) {
            self.init(bodyValue: content)
        }


    }
}
// MARK: - Attributes
public extension HTML.Ins {
    ///Contains a URL which points to the source of the quote.
    func `cite`(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "cite", value: { value().description }))
    }

    ///This attribute indicates the time and date of the change and must be a valid date string.
    func `datetime`(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "datetime", value: { value().description }))
    }

}