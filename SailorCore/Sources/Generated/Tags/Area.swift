// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Area.swift
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

/// The area element represents either a hyperlink with some text and a corresponding area on an image map, or a dead area on an image map.
public struct Area: BodyElement {
    /// name of the html tag associated with this type
    public static var name: String { "area" }

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
public extension Area {
    ///The text alternative of the area element.
    func `alt`(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "alt", value: { value().description }))
    }

    ///The coordinates of the area.
    func `coords`(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "coords", value: { value().description }))
    }

    ///Indicates that the hyperlink is to be used for downloading a resource.
    func `download`(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "download", value: { value().description }))
    }

    ///The URL of the hyperlink.
    func `href`(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "href", value: { value().description }))
    }

    ///The language of the linked resource.
    func `hreflang`(_ value: @autoclosure @escaping () -> Unit.Language) -> Self {
        attribute(.init(name: "hreflang", value: { value().description }))
    }

    ///The media the resource applies to.
    func `media`(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "media", value: { value().description }))
    }

    ///Specifies which referrer information to send when fetching the resource.
    func `referrerpolicy`(_ value: @autoclosure @escaping () -> Unit.ReferrerPolicy) -> Self {
        attribute(.init(name: "referrerpolicy", value: { value().description }))
    }

    ///The relationship between the document containing the hyperlink and the destination resource.
    func `rel`(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "rel", value: { value().description }))
    }

    ///The shape of the area.
    func `shape`(_ value: @autoclosure @escaping () -> Unit.Shape) -> Self {
        attribute(.init(name: "shape", value: { value().description }))
    }

    ///The browsing context for the hyperlink.
    func `target`(_ value: @autoclosure @escaping () -> Unit.Target) -> Self {
        attribute(.init(name: "target", value: { value().description }))
    }

}