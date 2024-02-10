// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  A.swift
//
//  Created by Joshua Davis.
//

import Sailboat

/// Together with its href attribute, creates a hyperlink to web pages, files, email addresses, locations within the current page, or anything else a URL can address.
public struct A: Element {
    public struct ElementAttributeGroup: AttributeGroup, GlobalAttributeGroup {
        public let name: String
        public let value: String
        
        public init(name: String, value: String) {
            self.name = name
            self.value = value
        }

        ///The URL of the link.
        static func href(_ value: String) -> Self {
            .init(name: "href", value: value.description)
        }

        ///Specifies that the target will be downloaded when a user clicks on the hyperlink.
        static func download(_ value: String) -> Self {
            .init(name: "download", value: value.description)
        }

        ///Specifies the language of the linked document.
        static func hreflang(_ value: Unit.Language) -> Self {
            .init(name: "hreflang", value: value.description)
        }

        ///Specifies what media/device the linked document is optimized for.
        static func media(_ value: String) -> Self {
            .init(name: "media", value: value.description)
        }

        ///Specifies a space-separated list of URLs to which, when the link is followed, post requests with the body ping will be sent by the browser (in the background). Typically used for tracking.
        static func ping(_ value: String...) -> Self {
            .init(name: "ping", value: value.map{ $0.description }.joined(separator: " "))
        }

        ///Specifies which referrer information to send when fetching the linked resource.
        static func referrerpolicy(_ value: Unit.ReferrerPolicy) -> Self {
            .init(name: "referrerpolicy", value: value.description)
        }

        ///Specifies the relationship between the current document and the linked document.
        static func rel(_ value: String) -> Self {
            .init(name: "rel", value: value.description)
        }

        ///Specifies where to open the linked document.
        static func target(_ value: Unit.Target) -> Self {
            .init(name: "target", value: value.description)
        }

    }

    /// name of the html tag associated with this type
    public var name: String { "a" }

    /// attributes associated with this type
    public var attributes: [String: String]

    /// events associated with this type
    public var events: Events

    /// content that is contained by this html element
    public var content: TagContent

    public init(_ text: String) {
        self.content = .text(text)
        self.attributes = .init()
        self.events = .init()
    }

    public init(_ attributes: ElementAttributeGroup..., @PageBuilder content: @escaping () -> any Operator) {
        self.content = .list(content)
        self.attributes = .init()
        self.events = .init()

        for attribute in attributes {
            self.attributes[attribute.name] = attribute.value
        }

    }

    public init(href: String) {
        self.content = .text("")
        self.attributes = .init()
        self.events = .init()

        self.attributes["href"] = href.description
        
    }

    public init(href: String, @PageBuilder content: @escaping () -> any Operator) {
        self.content = .list(content)
        self.attributes = .init()
        self.events = .init()

        self.attributes["href"] = href.description
        
    }

}

// MARK: - Attributes
public extension A {
    ///The URL of the link.
    func href(_ value: String) -> Self {
        attribute(.init(name: "href", value: value.description))
    }

    ///Specifies that the target will be downloaded when a user clicks on the hyperlink.
    func download(_ value: String) -> Self {
        attribute(.init(name: "download", value: value.description))
    }

    ///Specifies the language of the linked document.
    func hreflang(_ value: Unit.Language) -> Self {
        attribute(.init(name: "hreflang", value: value.description))
    }

    ///Specifies what media/device the linked document is optimized for.
    func media(_ value: String) -> Self {
        attribute(.init(name: "media", value: value.description))
    }

    ///Specifies a space-separated list of URLs to which, when the link is followed, post requests with the body ping will be sent by the browser (in the background). Typically used for tracking.
    func ping(_ value: String...) -> Self {
        attribute(.init(name: "ping", value: value.description))
    }

    ///Specifies which referrer information to send when fetching the linked resource.
    func referrerpolicy(_ value: Unit.ReferrerPolicy) -> Self {
        attribute(.init(name: "referrerpolicy", value: value.description))
    }

    ///Specifies the relationship between the current document and the linked document.
    func rel(_ value: String) -> Self {
        attribute(.init(name: "rel", value: value.description))
    }

    ///Specifies where to open the linked document.
    func target(_ value: Unit.Target) -> Self {
        attribute(.init(name: "target", value: value.description))
    }

}