// This file was autogenerated by Mustache. DO NOT CHANGE.
//
//  Input.swift
//
//
//  Created by Joshua Davis.
//

import Foundation
import JavaScriptKit

public struct Input: HTMLElement {

    public var body: some Page {
        return self
    }
    
    public var attributes: Attributes

    var children: [any Page]
    var content: String
    var element: JSValue

    private init(children: [any Page], content: String) {
        self.element = App.document.createElement("input")
        self.children = children
        self.content = content
        self.attributes = .init()
    }

    public init() {
        self.init(children: [], content: "")
    }
    
    
}