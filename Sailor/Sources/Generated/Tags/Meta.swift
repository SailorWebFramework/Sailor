// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Meta.swift
//
//  Created by Joshua Davis.
//

import Foundation
import Sailboat

/// The meta element represents various kinds of metadata that cannot be expressed using the title, base, link, style, and script elements.
public struct Meta: Element {
    /// name of the html tag associated with this type
    public static var name: String { "meta" }

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

    public init() {  
        self.init(bodyValue: nil)
    }


}

// MARK: - Attributes
public extension Meta {
    ///Declares the document's character encoding.
    func charset(_ value: String) -> Self {
        attribute(.init(name: "charset", value: value.description))
    }

    ///The value of the element.
    func content(_ value: String) -> Self {
        attribute(.init(name: "content", value: value.description))
    }

    ///Indicates that the content is a pragma directive.
    func httpEquiv(_ value: String) -> Self {
        attribute(.init(name: "httpEquiv", value: value.description))
    }

    ///The name of the metadata.
    func name(_ value: String) -> Self {
        attribute(.init(name: "name", value: value.description))
    }

}