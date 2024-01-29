// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Div.swift
//
//  Created by Joshua Davis.
//

import Sailboat

/// The generic container for flow content. It has no effect on the content or layout until styled in some way using CSS (e.g., styling is directly applied to it, or some kind of layout model like flexbox is applied to its parent element).
public struct Div: HTMLElement {

    public var name: String { "div" }

    public var body: some Page {
        InternalError.recursingInPageBody(name: "div")
        return self
    }
    
    public var attributes: [String: String]
    public var events: Events

    public var content: TagContent

    public init() {   
        self.init("")       
    }

    public init(_ attributes: Attribute..., @PageBuilder content: @escaping () -> any Operator) {
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



//    public func attribute(_ value: Attribute) {
//        for attribute in attributes {
//            if attribute.description == value.description { return self }
//            var copy = self
//            copy.attributes[type] = value
//            return copy
//        }
//
//        return self
//    }
    
    /*
    public func attribute(_ type: Attribute, value: some AttributeValue) -> Self {
        if self.attributes[type]?.description == value.description { return self }
        var copy = self
        copy.attributes[type] = value
        return copy
    }
    */
}