// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Nav.swift
//
//  Created by Joshua Davis.
//

import Sailboat

/// The nav element represents a section of a page that links to other pages or to parts within the page: a section with navigation links.
public struct Nav: Element {
    public struct ElementAttributeGroup: AttributeGroup, GlobalAttributeGroup {
        public let name: String
        public let value: String
        
        public init(name: String, value: String) {
            self.name = name
            self.value = value
        }

    }

    /// name of the html tag associated with this type
    public var name: String { "nav" }

    /// attributes associated with this type
    public var attributes: [String: String]

    /// events associated with this type
    public var events: Events

    /// content that is contained by this html element
    public var content: TagContent

    public init(_ attributes: ElementAttributeGroup..., @PageBuilder content: @escaping () -> any Operator) {
        self.content = .list(content)
        self.attributes = .init()
        self.events = .init()

        for attribute in attributes {
            self.attributes[attribute.name] = attribute.value
        }

    }

}

// MARK: - Attributes
public extension Nav {
}