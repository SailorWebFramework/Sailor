// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  TableData.swift
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

/// The td element defines a cell of a table that contains data.
public struct TableData: BodyElement {
    /// name of the html tag associated with this type
    public static var name: String { "td" }

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
public extension TableData {
    ///Specifies the number of columns a cell should span.
    func `colspan`(_ value: @autoclosure @escaping () -> Int) -> Self {
        attribute(.init(name: "colspan", value: { value().description }))
    }

    ///Specifies one or more header cells a cell is related to.
    func `headers`(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "headers", value: { value().description }))
    }

    ///Specifies the number of rows a cell should span.
    func `rowspan`(_ value: @autoclosure @escaping () -> Int) -> Self {
        attribute(.init(name: "rowspan", value: { value().description }))
    }

}