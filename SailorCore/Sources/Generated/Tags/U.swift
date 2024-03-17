// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  U.swift
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

/// The u element represents a span of text with an unarticulated, though explicitly rendered, non-textual annotation, such as labeling the text as being a proper name in Chinese text (a Chinese proper name mark), or labeling the text as being misspelt.
public struct U: Element {
    /// name of the html tag associated with this type
    public static var name: String { "u" }

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

        self.attributes["id"] = id
        //SailboatGlobal.manager.managedPages.elements[id] = self
    }

    public init(@PageBuilder content: @escaping () -> any Operator) {
        self.init(bodyValue: content)
    }


}

// MARK: - Attributes
public extension U {
}