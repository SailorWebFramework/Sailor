// This file was autogenerated by Mustache. DO NOT CHANGE.
//
//  Img.swift
//
//
//  Created by Joshua Davis.
//

import Foundation
import SwiftSoup

public struct Img: HTMLElement {
    var element = Element(Tag("img"), "")

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
    

    private init(children: [any Page], content: String) {
        self.children = children
        self.content = content
        self.attributes = .init()

    }
    
}