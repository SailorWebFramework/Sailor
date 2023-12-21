//
//  List.swift
//  
//
//  Created by Joshua Davis on 10/12/23.
//

import JavaScriptKit

// TODO: remove list and just use Div?
// TODO: rename to like EmptyContainer
public struct List: HTMLElement {

    var attributes: Attributes
    var events: Events
    var children: [any Page]
    var content: String
    
    // TODO: name this something else? error?
    var name: String { "div" }
    
    public var body: some Page {
        InternalError.recursingInPageBody(name: "list")
        return self
    }
    
    public init() {
        self.init([])
    }

    public init(_ children: [any Page]) {
        self.children = children
        self.content = ""
        self.events = [:]
        self.attributes = .init()

    }
    
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
