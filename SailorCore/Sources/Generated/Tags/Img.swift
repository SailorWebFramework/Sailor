// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Img.swift
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

/// The img element represents an image.
public struct Img: BodyElement {
    /// name of the html tag associated with this type
    public static var name: String { "img" }

    /// unique identifier for this html element
    public var id: ElementID

    /// attributes associated with this type
    public var attributes: [String: () -> String]

    /// events associated with this type
    public var events: [String: (EventResult) -> Void]

    /// content that is contained by this html element
    public var content: () -> any Fragment

    public var renderer: any Renderable

        internal init(bodyValue: (() -> any Fragment)?) {
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
        
        self.attributes["id"] = { id }
    }

    public init(src: (@escaping () -> String), alt: (@escaping () -> String)) {
        self.init(bodyValue: nil)

        self.attributes["src"] = { src().description }
        self.attributes["alt"] = { alt().description }
    }


}

// MARK: - Attributes
public extension Img {
    ///The alternative text for the image.
    func alt(_ value: (@escaping () -> String)) -> Self {
        attribute(.init(name: "alt", value: { value().description }))
    }

    ///How the element handles cross-origin requests.
    func crossorigin(_ value: (@escaping () -> Unit.CrossOrigin)) -> Self {
        attribute(.init(name: "crossorigin", value: { value().description }))
    }

    ///The intrinsic height of the image in pixels.
    func height(_ value: (@escaping () -> Int)) -> Self {
        attribute(.init(name: "height", value: { value().description }))
    }

    ///Indicates that the image is part of a server-side image map.
    func ismap(_ value: (@escaping () -> Bool)) -> Self {
        attribute(.init(name: "ismap", value: { value().description }))
    }

    ///Indicates how the browser should load the image.
    func loading(_ value: (@escaping () -> Unit.Loading)) -> Self {
        attribute(.init(name: "loading", value: { value().description }))
    }

    ///Specifies which referrer information to send when fetching the image.
    func referrerpolicy(_ value: (@escaping () -> Unit.ReferrerPolicy)) -> Self {
        attribute(.init(name: "referrerpolicy", value: { value().description }))
    }

    ///The sizes attribute gives the sizes of the icons for visual media.
    func sizes(_ value: (@escaping () -> String)) -> Self {
        attribute(.init(name: "sizes", value: { value().description }))
    }

    ///The URL of the image.
    func src(_ value: (@escaping () -> String)) -> Self {
        attribute(.init(name: "src", value: { value().description }))
    }

    ///A list of one or more strings separated by commas indicating a set of possible images to use for the source.
    func srcset(_ value: (@escaping () -> String)) -> Self {
        attribute(.init(name: "srcset", value: { value().description }))
    }

    ///The URL of the image map to use.
    func usemap(_ value: (@escaping () -> String)) -> Self {
        attribute(.init(name: "usemap", value: { value().description }))
    }

    ///The intrinsic width of the image in pixels.
    func width(_ value: (@escaping () -> Int)) -> Self {
        attribute(.init(name: "width", value: { value().description }))
    }

}