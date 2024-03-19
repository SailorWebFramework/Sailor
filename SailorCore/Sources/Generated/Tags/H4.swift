// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  H4.swift
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

/// The h4 element represents a level 4 heading.
public struct H4: BodyElement {
    /// name of the html tag associated with this type
    public static var name: String { "h4" }

    /// unique identifier for this html element
    public var id: ElementID

    /// attributes associated with this type
    public var attributes: [String: String]

    /// events associated with this type
    public var events: [String: (EventResult) -> Void]

    /// content that is contained by this html element
    public var content: () -> any Fragment

    public var renderer: any Renderable

    private init(bodyValue: (() -> any Fragment)?) {
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

        // sets the id
        self.attributes["id"] = id
    }

    public init(@PageBuilder content: @escaping () -> any Fragment) {
        self.init(bodyValue: content)
    }


}

// MARK: - Attributes
public extension H4 {
}
