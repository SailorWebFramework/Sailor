//
//  Head.swift
//
//  Created by Joshua Davis.
//

import Foundation
import Sailboat
import SailorShared
#if os(WASI)
import SailorWeb
#else
//
#endif
//TODO: auto-generate maybe so its not annoying to update

/// The b element represents a span of text to which attention is being drawn for utilitarian purposes without conveying any extra importance and with no implication of an alternate voice or mood, such as key words in a document abstract, product names in a review, actionable words in interactive text-driven software, or an article lede.
public struct Head: Element {
    /// name of the html tag associated with this type
    public static var name: String { "head" }

    /// unique identifier for this html element
    public var id: ElementID

    /// attributes associated with this type
    public var attributes: [String: String]

    /// events associated with this type
    public var events: [String: (EventResult) -> Void]

    /// content that is contained by this html element
    public var content: () -> any Fragment

    public var renderer: any Renderable

    private init(bodyValue: (() -> any Fragment)?) {
        let id = UUID().uuidString
        self.id = id
        self.attributes = [:]
        self.events = [:]
        self.content = bodyValue ?? { List() }
        // special renderer for body
        #if os(WASI)
        self.renderer = JSNode(elementID: id, .head)
        #else
        self.renderer = EmptyRenderer()
        #endif
        
    }

    public init() {
        self.init(bodyValue: nil)
    }
    
    public init(@HeadBuilder content: @escaping () -> any Fragment) {
        self.init(bodyValue: content)
    }

}

// MARK: - Attributes
public extension Body {
}
