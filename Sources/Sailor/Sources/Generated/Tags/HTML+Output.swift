// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Output.swift
//


import Sailboat
import SailorShared

#if os(WASI)
import SailorWeb
#else
// if any other target are created
#endif

extension HTML {
    /// The output element represents the result of a calculation or user action.
    public struct Output: BodyElement {
        /// name of the html tag associated with this type
        @_spi(Private) public static var name: String { "output" }

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
public extension HTML.Output {
    ///The id of the form element that the output element is associated with (its form owner).
    func `for`(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "for", value: { value().description }))
    }

    ///The form element that the output element is associated with (its form owner).
    func `form`(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "form", value: { value().description }))
    }

    ///The name of the output element.
    func `name`(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "name", value: { value().description }))
    }

}