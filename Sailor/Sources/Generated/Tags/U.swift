// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  U.swift
//
//  Created by Joshua Davis.
//

import Sailboat

/// The u element represents a span of text with an unarticulated, though explicitly rendered, non-textual annotation, such as labeling the text as being a proper name in Chinese text (a Chinese proper name mark), or labeling the text as being misspelt.
public struct U: Element {
    public struct ElementAttributeGroup: AttributeGroup, GlobalAttributeGroup {
        public let name: String
        public let value: String
        
        public init(name: String, value: String) {
            self.name = name
            self.value = value
        }

    }

    /// name of the html tag associated with this type
    public var name: String { "u" }

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
public extension U {
}