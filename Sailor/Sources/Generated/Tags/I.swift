// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  I.swift
//
//  Created by Joshua Davis.
//

import Sailboat

/// The i element represents a span of text in an alternate voice or mood, or otherwise offset from the normal prose in a manner indicating a different quality of text, such as a taxonomic designation, a technical term, an idiomatic phrase from another language, a thought, or a ship name in Western texts.
public struct I: Element {
    public struct ElementAttributeGroup: AttributeGroup, GlobalAttributeGroup {
        public let name: String
        public let value: String
        
        public init(name: String, value: String) {
            self.name = name
            self.value = value
        }

    }

    /// name of the html tag associated with this type
    public var name: String { "i" }

    /// attributes associated with this type
    public var attributes: [String: String]

    /// events associated with this type
    public var events: Events

    /// content that is contained by this html element
    public var content: TagContent

    public init(_ text: String) {
        self.content = .text(text)
        self.attributes = .init()
        self.events = .init()
    }

}

// MARK: - Attributes
public extension I {
}