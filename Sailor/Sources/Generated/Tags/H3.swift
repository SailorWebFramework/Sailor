// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  H3.swift
//
//  Created by Joshua Davis.
//

import Foundation
import Sailboat

/// The h3 element represents a level 3 heading.
public struct H3: Element {
    /// name of the html tag associated with this type
    public static var name: String { "h3" }

    /// unique identifier for this html element
    public var id: ElementID

    /// attributes associated with this type
    public var attributes: [String: String]

    /// events associated with this type
    public var events: [String: (EventResult) -> Void]

    /// content that is contained by this html element
    public var content: (() -> any Operator)?

    public var renderer: any Renderable

    private init(bodyValue: (() -> any Operator)?) {
        let id = UUID().uuidString
        self.id = id
        self.attributes = [:]
        self.events = [:]
        self.content = bodyValue
        self.renderer = JSNode(named: Self.name, elementID: id)
    }

    public init(text: @escaping () -> any Operator) {
        self.init(bodyValue: text)
    }


}

// MARK: - Attributes
public extension H3 {
}