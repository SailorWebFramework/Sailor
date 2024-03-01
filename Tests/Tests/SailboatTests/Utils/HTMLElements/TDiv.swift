// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Div.swift
//
//  Created by Joshua Davis.
//

import Sailboat

/// Div used to test internal Sailboat
public struct TDiv: Element {
    public var renderer: any Renderable = TestRenderable()
    
    public struct ElementAttributeGroup: AttributeGroup {
        public let name: String
        public let value: String
        
        public init(name: String, value: String) {
            self.name = name
            self.value = value
        }
    }
    
    public var name: String { "div" }
    public var body: some Page {
        InternalError.recursingInPageBody(name: "div")
        return self
    }
    
    public var attributes: [String: String]
    public var events: [String: (EventResult) -> Void]
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
