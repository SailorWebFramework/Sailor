// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Link.swift
//
//  Created by Joshua Davis.
//

import Foundation
import Sailboat

/// The link element allows authors to link their document to other resources.
public struct Link: Element {

    public var id: ElementID = UUID().uuidString

    /// name of the html tag associated with this type
    public var name: String { "link" }

    /// attributes associated with this type
    public var attributes: [String: String]

    /// events associated with this type
    public var events: [String: (EventResult) -> Void]

    /// content that is contained by this html element
    public var content: TagContent

    public var renderer: some Renderable = JSNode(named: "link")


    public init(rel: String, href: String) {
        self.content = .text("")
        self.attributes = .init()
        self.events = .init()

        self.attributes["rel"] = rel.description
        self.attributes["href"] = href.description
        
    }


}

// MARK: - Attributes
public extension Link {
    ///The URL of the link.
    func href(_ value: String) -> Self {
        attribute(.init(name: "href", value: value.description))
    }

    ///How the element handles cross-origin requests.
    func crossorigin(_ value: Unit.CrossOrigin) -> Self {
        attribute(.init(name: "crossorigin", value: value.description))
    }

    ///Specifies the language of the linked document.
    func hreflang(_ value: Unit.Language) -> Self {
        attribute(.init(name: "hreflang", value: value.description))
    }

    ///Specifies what media/device the linked document is optimized for.
    func media(_ value: String) -> Self {
        attribute(.init(name: "media", value: value.description))
    }

    ///Specifies which referrer information to send when fetching the linked resource.
    func referrerpolicy(_ value: Unit.ReferrerPolicy) -> Self {
        attribute(.init(name: "referrerpolicy", value: value.description))
    }

    ///Specifies the relationship between the current document and the linked document.
    func rel(_ value: String) -> Self {
        attribute(.init(name: "rel", value: value.description))
    }

    ///The sizes attribute gives the sizes of the icons for visual media.
    func sizes(_ value: String) -> Self {
        attribute(.init(name: "sizes", value: value.description))
    }

    ///Specifies the media type of the linked document.
    func type(_ value: String) -> Self {
        attribute(.init(name: "type", value: value.description))
    }

}