// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Img.swift
//
//  Created by Joshua Davis.
//

import Sailboat

/// The img element represents an image.
public struct Img: Element {
    public struct ElementAttributeGroup: AttributeGroup, GlobalAttributeGroup {
        public let name: String
        public let value: String
        
        public init(name: String, value: String) {
            self.name = name
            self.value = value
        }

        ///The alternative text for the image.
        static func alt(_ value: String) -> Self {
            .init(name: "alt", value: value.description)
        }

        ///How the element handles cross-origin requests.
        static func crossorigin(_ value: Unit.CrossOrigin) -> Self {
            .init(name: "crossorigin", value: value.description)
        }

        ///The intrinsic height of the image in pixels.
        static func height(_ value: Int) -> Self {
            .init(name: "height", value: value.description)
        }

        ///Indicates that the image is part of a server-side image map.
        static func ismap(_ value: Bool) -> Self {
            .init(name: "ismap", value: value.description)
        }

        ///Indicates how the browser should load the image.
        static func loading(_ value: Unit.Loading) -> Self {
            .init(name: "loading", value: value.description)
        }

        ///Specifies which referrer information to send when fetching the image.
        static func referrerpolicy(_ value: Unit.ReferrerPolicy) -> Self {
            .init(name: "referrerpolicy", value: value.description)
        }

        ///The sizes attribute gives the sizes of the icons for visual media.
        static func sizes(_ value: String) -> Self {
            .init(name: "sizes", value: value.description)
        }

        ///The URL of the image.
        static func src(_ value: String) -> Self {
            .init(name: "src", value: value.description)
        }

        ///A list of one or more strings separated by commas indicating a set of possible images to use for the source.
        static func srcset(_ value: String) -> Self {
            .init(name: "srcset", value: value.description)
        }

        ///The URL of the image map to use.
        static func usemap(_ value: String) -> Self {
            .init(name: "usemap", value: value.description)
        }

        ///The intrinsic width of the image in pixels.
        static func width(_ value: Int) -> Self {
            .init(name: "width", value: value.description)
        }

    }

    /// name of the html tag associated with this type
    public var name: String { "img" }

    /// attributes associated with this type
    public var attributes: [String: String]

    /// events associated with this type
    public var events: [String: (EventResult) -> Void]

    /// content that is contained by this html element
    public var content: TagContent

    public var renderer: any Renderable = JSNodeRenderer()


    public init(src: String, alt: String) {
        self.content = .text("")
        self.attributes = .init()
        self.events = .init()

        self.attributes["src"] = src.description
        self.attributes["alt"] = alt.description
        
    }

}

// MARK: - Attributes
public extension Img {
    ///The alternative text for the image.
    func alt(_ value: String) -> Self {
        attribute(.init(name: "alt", value: value.description))
    }

    ///How the element handles cross-origin requests.
    func crossorigin(_ value: Unit.CrossOrigin) -> Self {
        attribute(.init(name: "crossorigin", value: value.description))
    }

    ///The intrinsic height of the image in pixels.
    func height(_ value: Int) -> Self {
        attribute(.init(name: "height", value: value.description))
    }

    ///Indicates that the image is part of a server-side image map.
    func ismap(_ value: Bool) -> Self {
        attribute(.init(name: "ismap", value: value.description))
    }

    ///Indicates how the browser should load the image.
    func loading(_ value: Unit.Loading) -> Self {
        attribute(.init(name: "loading", value: value.description))
    }

    ///Specifies which referrer information to send when fetching the image.
    func referrerpolicy(_ value: Unit.ReferrerPolicy) -> Self {
        attribute(.init(name: "referrerpolicy", value: value.description))
    }

    ///The sizes attribute gives the sizes of the icons for visual media.
    func sizes(_ value: String) -> Self {
        attribute(.init(name: "sizes", value: value.description))
    }

    ///The URL of the image.
    func src(_ value: String) -> Self {
        attribute(.init(name: "src", value: value.description))
    }

    ///A list of one or more strings separated by commas indicating a set of possible images to use for the source.
    func srcset(_ value: String) -> Self {
        attribute(.init(name: "srcset", value: value.description))
    }

    ///The URL of the image map to use.
    func usemap(_ value: String) -> Self {
        attribute(.init(name: "usemap", value: value.description))
    }

    ///The intrinsic width of the image in pixels.
    func width(_ value: Int) -> Self {
        attribute(.init(name: "width", value: value.description))
    }

}