// This file was autogenerated by Mustache. DO NOT CHANGE.
//
//  Video.swift
//
//
//  Created by Joshua Davis.
//

import Foundation

public struct Video: HTMLElement {
    var element = Element("video")

    public var body: some Page {
        return self
    }
    
    public var attributes: Attributes

    var children: [any Page]
    var content: String
    
    public init() {
        self.children = []
        self.content = ""
        self.attributes = .init()
    }
    
    public init(@PageBuilder _ content: () -> List) {
        self.init(children: content().children, content: "")
    }
    
    public init(_ content: String) {
        self.init(children: [], content: content)
    }

    private init(children: [any Page], content: String) {
        self.children = children
        self.content = content
        self.attributes = .init()

    }
    
}