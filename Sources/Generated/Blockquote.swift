// This file was autogenerated by Mustache. Do not change.
//
//  Blockquote.swift
//
//
//  Created by Joshua Davis.
//

import Foundation
import SwiftSoup

public struct Blockquote: HTMLElement {
    var element = Element(Tag(blockquote), "")

    public var body: some Page {
        return self
    }
    
    public var style: Style

    var children: [any Page]
    var content: String
    
    public init(style: Style = .none()) {
        self.children = []
        self.style = style
        self.content = ""
    }
    
    public init(@PageBuilder _ content: () -> [any Page]) {
        self.init(children: content(), content: "", style: .none())
    }
    
    public init(content: String) {
        self.init(children: [], content: content, style: .none())
    }

    private init(children: [any Page], content: String, style: Style) {
        self.children = children
        self.style = style
        self.content = content

    }
    
    public func style(style: Style) -> Div {
        var copy = self
        copy.style += style
        return copy
    }
    
}