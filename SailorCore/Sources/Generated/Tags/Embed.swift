// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Embed.swift
//
//  Created by Joshua Davis.
//

import Sailboat
import SailorShared

#if os(WASI)
import SailorWeb
#else
// if any other target are created
#endif

/// The embed element provides an integration point for an external (typically non-HTML) application or interactive content.
public struct Embed: BodyElement {
    /// name of the html tag associated with this type
    public static var name: String { "embed" }

    /// attributes associated with this type
    public var attributes: [String: () -> any AttributeValue]

    /// events associated with this type
    public var events: [String: (EventResult) -> Void]

    /// content that is contained by this html element
    public var content: () -> any Fragment

    public var renderer: any Renderable
    
    internal init(bodyValue: (() -> any Fragment)?) {
        self.attributes = [:]
        self.events = [:]
        self.content = bodyValue ?? { List() }
        #if os(WASI)
        self.renderer = JSNode(named: Self.name)
        #else
        self.renderer = EmptyRenderer()
        #endif
    }

    public init() {  
        self.init(bodyValue: nil)
    }


}

// MARK: - Attributes
public extension Embed {
    ///The height of the embedded content area.
    func `height`(_ value: @autoclosure @escaping () -> Int) -> Self {
        attribute(.init(name: "height", value: { value().description }))
    }

    ///The URL of the embeddable content.
    func `src`(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "src", value: { value().description }))
    }

    ///The type of the embedded content.
    func `type`(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "type", value: { value().description }))
    }

    ///The width of the embedded content area.
    func `width`(_ value: @autoclosure @escaping () -> Int) -> Self {
        attribute(.init(name: "width", value: { value().description }))
    }

}