// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  B.swift
//
//  Created by Joshua Davis.
//

import Sailboat

/// The b element represents a span of text to which attention is being drawn for utilitarian purposes without conveying any extra importance and with no implication of an alternate voice or mood, such as key words in a document abstract, product names in a review, actionable words in interactive text-driven software, or an article lede.
public struct B: Element {
    public struct ElementAttributeGroup: AttributeGroup, GlobalAttributeGroup {
        public let name: String
        public let value: String
        
        public init(name: String, value: String) {
            self.name = name
            self.value = value
        }

    }

    /// name of the html tag associated with this type
    public var name: String { "b" }

    /// attributes associated with this type
    public var attributes: [String: String]

    /// events associated with this type
    public var events: [String: (EventResult) -> Void]

    /// content that is contained by this html element
    public var content: TagContent

    public var renderer: any Renderable = JSNodeRenderer()


    public init(_ text: String) {
        self.content = .text(text)
        self.attributes = .init()
        self.events = .init()
    }

}

// MARK: - Attributes
public extension B {
}