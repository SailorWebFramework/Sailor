// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Link.swift
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

/// The link element allows authors to link their document to other resources.
public struct Link: Element {
    /// name of the html tag associated with this type
    public static var name: String { "link" }

    /// unique identifier for this html element
    public var id: ElementID

    /// attributes associated with this type
    public var attributes: [String: String]

    /// events associated with this type
    public var events: [String: (EventResult) -> Void]

    /// content that is contained by this html element
    public var content: () -> any Operator

    public var renderer: any Renderable

    private init(bodyValue: (() -> any Operator)?) {
        let id = UUID().uuidString
        self.id = id
        self.attributes = [:]
        self.events = [:]
        self.content = bodyValue ?? { List() }
        #if os(WASI)
        self.renderer = JSNode(named: Self.name, elementID: id)
        #else
        self.renderer = EmptyRenderer()
        #endif

        //SailboatGlobal.manager.managedPages.elements[id] = self
    }

    public init(rel: String, href: String) {
        self.init(bodyValue: nil)

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