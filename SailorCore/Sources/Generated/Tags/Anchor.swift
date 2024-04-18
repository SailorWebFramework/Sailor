// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Anchor.swift
//
//  Created by Joshua Davis.
//

import Foundation
import Sailboat
import SailorShared

#if os(WASI)
import SailorWeb
#else
// if any other target are created
#endif

/// Together with its href attribute, creates a hyperlink to web pages, files, email addresses, locations within the current page, or anything else a URL can address.
public struct Anchor: BodyElement {
    /// name of the html tag associated with this type
    public static var name: String { "anchor" }

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
    public init(@PageBuilder _ content: @escaping () -> any Fragment) {
        self.init(bodyValue: content)
    }


}

// MARK: - Attributes
public extension Anchor {
    ///The URL of the link.
    func href(_ value: (@escaping () -> String)) -> Self {
        attribute(.init(name: "href", value: { value().description }))
    }

    ///Specifies that the target will be downloaded when a user clicks on the hyperlink.
    func download(_ value: (@escaping () -> String)) -> Self {
        attribute(.init(name: "download", value: { value().description }))
    }

    ///Specifies the language of the linked document.
    func hreflang(_ value: (@escaping () -> Unit.Language)) -> Self {
        attribute(.init(name: "hreflang", value: { value().description }))
    }

    ///Specifies what media/device the linked document is optimized for.
    func media(_ value: (@escaping () -> String)) -> Self {
        attribute(.init(name: "media", value: { value().description }))
    }

    ///Specifies a space-separated list of URLs to which, when the link is followed, post requests with the body ping will be sent by the browser (in the background). Typically used for tracking.
    func ping(_ value: (@escaping () -> String)) -> Self {
        attribute(.init(name: "ping", value: { value().description }))
    }

    ///Specifies which referrer information to send when fetching the linked resource.
    func referrerpolicy(_ value: (@escaping () -> Unit.ReferrerPolicy)) -> Self {
        attribute(.init(name: "referrerpolicy", value: { value().description }))
    }

    ///Specifies the relationship between the current document and the linked document.
    func rel(_ value: (@escaping () -> String)) -> Self {
        attribute(.init(name: "rel", value: { value().description }))
    }

    ///Specifies where to open the linked document.
    func target(_ value: (@escaping () -> Unit.Target)) -> Self {
        attribute(.init(name: "target", value: { value().description }))
    }

}