// This file was autogenerated by Mustache. DO NOT CHANGE.
//
//  Kbd.swift
//
//
//  Created by Joshua Davis.
//

import Foundation
import JavaScriptKit

public struct Kbd: HTMLElement {

    public var body: some Page {
        return self
    }
    
    var name: String {
        "kbd"
    }

    var attributes: Attributes
    var events: Events

    var children: [any Page]
    var content: String

    private init(children: [any Page] = [], content: String = "") {          
        self.children = children
        self.content = content
        self.attributes = .init()
        self.events = [:]
    }

    public init(_ children: [any Page]) {          
        self.init(children: children, content: "")
    }
    public init() {          
        self.init(children: [], content: "")
    }

    public init(@PageBuilder _ content: () -> any Page) {
        if let page = content() as? List {
            self.init(children: page.children, content: "")
        } else {
            self.init(children: [content()], content: "")
        }
    }
    
    public init(_ content: String) {
        self.init(children: [], content: content)
    }

    //MARK- ATTRIBUTES
    public func style(_ properties: Style.Property...) -> Self {
        return style(Style(properties))
    }

    public func style(_ style: Style) -> Self {
        return attribute(.style, value: style)
    }

    public func attribute(_ type: Attribute, value: some AttributeValue) -> Self {
        if self.attributes[type]?.description == value.description { return self }
        var copy = self
        copy.attributes[type] = value
        return copy
    }
    
}