// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  H3.swift
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

/// The h3 element represents a level 3 heading.
public struct H3: BodyElement {
    /// name of the html tag associated with this type
    public static var name: String { "h3" }

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

    public init(@PageBuilder _ content: @escaping () -> any Fragment) {
        self.init(bodyValue: content)
    }


}

// MARK: - Attributes
public extension H3 {
}