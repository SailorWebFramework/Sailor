// This file was autogenerated by Mustache. DO NOT CHANGE.
//
//  Br.swift
//
//
//  Created by Joshua Davis.
//

import Foundation
import JavaScriptKit

public struct Br: HTMLElement {

    public var body: some Page {
        return self
    }
    
    var name: String {
        "br"
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