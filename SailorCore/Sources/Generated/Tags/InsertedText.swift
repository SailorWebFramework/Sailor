// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  InsertedText.swift
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

/// The ins element represents a range of text that has been added to a document.
public struct InsertedText: BodyElement {
    /// name of the html tag associated with this type
    public static var name: String { "ins" }

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
public extension InsertedText {
    ///Contains a URL which points to the source of the quote.
    func `cite`(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "cite", value: { value().description }))
    }

    ///This attribute indicates the time and date of the change and must be a valid date string.
    func `datetime`(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "datetime", value: { value().description }))
    }

}