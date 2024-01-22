// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Div.swift
//
//  Created by Joshua Davis.
//

import Sailboat

/// Button used to test internal Sailboat
public struct TButton: HTMLElement {
    
    public var name: String { "button" }
    public var body: some Page {
        InternalError.recursingInPageBody(name: "button")
        return self
    }
    
    public var attributes: [String: String]
    public var events: Events
    public var content: TagContent

    public init() {
        self.init("")
    }

    public init(_ attributes: [String:String] = .init(), @PageBuilder content: @escaping () -> any Operator) {
        self.content = .list(content)
        self.attributes = attributes
        self.events = [:]
    }
    
    public init(_ text: String) {
        self.content = .text(text)
        self.attributes = .init()
        self.events = [:]
    }

}
