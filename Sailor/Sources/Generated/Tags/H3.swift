// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  H3.swift
//
//  Created by Joshua Davis.
//

import Sailboat

/// The h3 element represents a level 3 heading.
public struct H3: Element {
    public struct ElementAttributeGroup: AttributeGroup, GlobalAttributeGroup {
        public let name: String
        public let value: String
        
        public init(name: String, value: String) {
            self.name = name
            self.value = value
        }

    }

    /// name of the html tag associated with this type
    public var name: String { "h3" }

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
public extension H3 {
}