// This file was autogenerated by Mustache. DO NOT CHANGE.
//
//  Aside.swift
//
//
//  Created by Joshua Davis.
//

import Foundation
import JavaScriptKit

public struct Aside: HTMLElement {

    public var body: some Page {
        return self
    }
    
    public var attributes: Attributes

    var children: [any Page]
    var content: String
    var element: JSValue

    private init(children: [any Page], content: String) {
        self.element = App.document.createElement("aside")
        self.children = children
        self.content = content
        self.attributes = .init()
    }

    public init() {
        self.init(children: [], content: "")
    }
    
    public init(@PageBuilder _ content: () -> List) {
        self.init(children: content().children, content: "")
    }
    
    public init(_ content: String) {
        self.init(children: [], content: content)
    }
    
}