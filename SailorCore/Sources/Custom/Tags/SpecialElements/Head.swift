//
//  Head.swift
//
//  Created by Joshua Davis.
//

import Sailboat
import SailorShared
#if os(WASI)
import SailorWeb
#else
//
#endif
//TODO: auto-generate maybe so its not annoying to update

extension HTML {
    /// The b element represents a span of text to which attention is being drawn for utilitarian purposes without conveying any extra importance and with no implication of an alternate voice or mood, such as key words in a document abstract, product names in a review, actionable words in interactive text-driven software, or an article lede.
    public struct Head: Element, WebHead {
        /// name of the html tag associated with this type
        public static var name: String { "head" }
        
        /// unique identifier for this html element
        //    public var sid: SailboatID? = nil
        
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
            self.renderer = JSNode(.head)
#else
            self.renderer = EmptyRenderer()
#endif
            
        }
        
        public init() {
            self.init(bodyValue: nil)
        }
        
        public init(@PageBuilder content: @escaping () -> any Fragment) {
            self.init(bodyValue: content)
        }
        
    }
}
