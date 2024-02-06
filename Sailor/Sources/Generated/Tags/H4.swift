// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  H4.swift
//
//  Created by Joshua Davis.
//

import Sailboat

/// The h4 element represents a level 4 heading.
public struct H4: Element {
    public struct ElementAttributeGroup: AttributeGroup, GlobalAttributeGroup {
        public let name: String
        public let value: String
        
        public init(name: String, value: String) {
            self.name = name
            self.value = value
        }

    }

    /// name of the html tag associated with this type
    public var name: String { "h4" }

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
public extension H4 {
}