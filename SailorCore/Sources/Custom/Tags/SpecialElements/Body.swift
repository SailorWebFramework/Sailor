//
//  Body.swift
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

//TODO: auto-generate maybe so its not annoying to update

extension HTML {
    /// The b element represents a span of text to which attention is being drawn for utilitarian purposes without conveying any extra importance and with no implication of an alternate voice or mood, such as key words in a document abstract, product names in a review, actionable words in interactive text-driven software, or an article lede.
    public struct Body: BodyElement, SailorCore.Body {
        /// name of the html tag associated with this type
        @_spi(Private) public static var name: String { "body" }

        /// attributes associated with this type
        @_spi(Private) public var attributes: [String: () -> any AttributeValue]
        
        /// events associated with this type
        @_spi(Private) public var events: [String: (EventResult) -> Void]
        
        /// content that is contained by this html element
        @_spi(Private) public var content: () -> any Fragment
        
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
            self.renderer = JSNode(.body)
#else
            self.renderer = EmptyRenderer()
#endif
            
        }
        
        public init(@PageBuilder content: @escaping () -> any Fragment) {
            self.init(bodyValue: content)
        }
        
    }
}
