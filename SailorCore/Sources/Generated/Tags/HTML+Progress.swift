// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Progress.swift
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
    /// The progress element represents the completion progress of a task.
    public struct Progress: BodyElement {
        /// name of the html tag associated with this type
        @_spi(Private) public static var name: String { "progress" }

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
public extension HTML.Progress {
    ///The maximum value.
    func `max`(_ value: @autoclosure @escaping () -> Double) -> Self {
        attribute(.init(name: "max", value: { value().description }))
    }

    ///The value.
    func `value`(_ value: @autoclosure @escaping () -> Double) -> Self {
        attribute(.init(name: "value", value: { value().description }))
    }

}