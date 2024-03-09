// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Nav.swift
//
//  Created by Joshua Davis.
//

import Foundation
import Sailboat

/// The nav element represents a section of a page that links to other pages or to parts within the page: a section with navigation links.
public struct Nav: Element {

    public var id: ElementID = UUID().uuidString

    /// name of the html tag associated with this type
    public var name: String { "nav" }

    /// attributes associated with this type
    public var attributes: [String: String]

    /// events associated with this type
    public var events: [String: (EventResult) -> Void]

    /// content that is contained by this html element
    public var content: TagContent

    public var renderer: some Renderable = JSNode(named: "nav")


    public init(@PageBuilder content: @escaping () -> any Operator) {
        self.content = .list(content)
        self.attributes = .init()
        self.events = .init()
    }


}

// MARK: - Attributes
public extension Nav {
}