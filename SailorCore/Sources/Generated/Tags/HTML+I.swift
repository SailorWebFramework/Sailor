// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  I.swift
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
    /// The i element represents a span of text in an alternate voice or mood, or otherwise offset from the normal prose in a manner indicating a different quality of text, such as a taxonomic designation, a technical term, an idiomatic phrase from another language, a thought, or a ship name in Western texts.
    public struct I: BodyElement {
        /// name of the html tag associated with this type
        public static var name: String { "i" }

        /// attributes associated with this type
        public var attributes: [String: () -> any AttributeValue]

        /// events associated with this type
        public var events: [String: (EventResult) -> Void]

        /// content that is contained by this html element
        public var content: () -> any Fragment

        public var renderer: any Renderable
        
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
public extension HTML.I {
}