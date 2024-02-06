// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Div.swift
//
//  Created by Joshua Davis.
//

import Sailboat

/// The div element has no special meaning at all. It represents its children. It can be used with the class, lang, and title attributes to mark up semantics common to a group of consecutive elements.
public struct Div: Element {
    public struct ElementAttributeGroup: AttributeGroup, GlobalAttributeGroup {
        public let name: String
        public let value: String
        
        public init(name: String, value: String) {
            self.name = name
            self.value = value
        }

    }

    /// name of the html tag associated with this type
    public var name: String { "div" }

    /// attributes associated with this type
    public var attributes: [String: String]

    /// events associated with this type
    public var events: Events

    /// content that is contained by this html element
    public var content: TagContent

    public init() {   
        self.init("")       
    }

    public init(_ attributes: ElementAttributeGroup..., @PageBuilder content: @escaping () -> any Operator) {
        self.content = .list(content)
        self.attributes = .init()
        
        for attribute in attributes {
            self.attributes[attribute.name] = attribute.value
        }
        
        self.events = [:]

    }
    
    public init(_ text: String) {
        self.content = .text(text)
        self.attributes = .init()
        self.events = [:]
    }

}

// MARK: - Attributes
public extension Div {
}