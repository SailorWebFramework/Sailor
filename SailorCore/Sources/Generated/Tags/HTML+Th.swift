// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Th.swift
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

extension HTML {
    /// The th element defines a cell as header of a group of table cells. The exact nature of this group is defined by the scope and headers attributes.
    public struct Th: BodyElement {
        /// name of the html tag associated with this type
        public static var name: String { "th" }

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
}
// MARK: - Attributes
public extension HTML.Th {
    ///Specifies an abbreviated version of the content in a header cell.
    func `abbr`(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "abbr", value: { value().description }))
    }

    ///Specifies the number of columns a header cell should span.
    func `colspan`(_ value: @autoclosure @escaping () -> Int) -> Self {
        attribute(.init(name: "colspan", value: { value().description }))
    }

    ///Specifies one or more header cells a cell is related to.
    func `headers`(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "headers", value: { value().description }))
    }

    ///Specifies the number of rows a header cell should span.
    func `rowspan`(_ value: @autoclosure @escaping () -> Int) -> Self {
        attribute(.init(name: "rowspan", value: { value().description }))
    }

    ///Specifies the set of data cells for which the current header cell provides header information.
    func `scope`(_ value: @autoclosure @escaping () -> Unit.Scope) -> Self {
        attribute(.init(name: "scope", value: { value().description }))
    }

}