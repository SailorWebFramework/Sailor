// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Optgroup.swift
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
    /// The optgroup element creates a grouping of options within a select element.
    public struct Optgroup: BodyElement {
        /// name of the html tag associated with this type
        @_spi(Private) public static var name: String { "optgroup" }

        /// attributes associated with this type
        @_spi(Private) public var attributes: [String: () -> any AttributeValue]

        /// events associated with this type
        @_spi(Private) public var events: [String: (EventResult) -> Void]

        /// content that is contained by this html element
        @_spi(Private) public var content: () -> any Fragment

        /// renderer that is used to render this element
        @_spi(Private) public var renderer: any Renderable

        @_spi(Private)
        public var body: Never {
            .error()
        }
        
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

        public init(@PageBuilder _ content: @escaping () -> any Fragment) {
            self.init(bodyValue: content)
        }


    }
}
// MARK: - Attributes
public extension HTML.Optgroup {
    ///A Boolean attribute indicating that the option group cannot be selected.
    func `disabled`(_ value: @autoclosure @escaping () -> Bool) -> Self {
        attribute(.init(name: "disabled", value: { value().description }))
    }

    ///The label for the option group.
    func `label`(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "label", value: { value().description }))
    }

}