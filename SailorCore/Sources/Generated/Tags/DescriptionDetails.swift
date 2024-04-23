// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  DescriptionDetails.swift
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

/// The dd element represents the description, definition, or value, part of a term-description group in a description list.
public struct DescriptionDetails: BodyElement {
    /// name of the html tag associated with this type
    public static var name: String { "dd" }

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

    public init(_ text: @autoclosure @escaping () -> String) {
        self.init(bodyValue: { List([text()], hash: "") } )
    }

    public init(@PageBuilder _ content: @escaping () -> any Fragment) {
        self.init(bodyValue: content)
    }


}

// MARK: - Attributes
public extension DescriptionDetails {
}