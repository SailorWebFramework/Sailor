// This file was autogenerated by Mustache. DO NOT CHANGE.
//
//  Var.swift
//
//
//  Created by Joshua Davis.
//

import Foundation
import JavaScriptKit

public struct Var: HTMLElement {

    public var body: some Page {
        return self
    }
    
    var name: String {
        "var"
    }

    var attributes: Attributes
    var events: [String: JSClosure]

    var children: [any Page]
    var content: String

    private init(children: [any Page], content: String) {          
        self.children = children
        self.content = content
        self.attributes = .init()
        self.events = [:]
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