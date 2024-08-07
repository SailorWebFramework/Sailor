// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Form.swift
//


import Sailboat
import SailorShared

#if os(WASI)
import SailorWeb
#else
// if any other target are created
#endif

extension HTML {
    /// The form element represents a document section that contains interactive controls to submit information to a web server.
    public struct Form: BodyElement {
        /// name of the html tag associated with this type
        @_spi(Private) public static var name: String { "form" }

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
public extension HTML.Form {
    ///Specifies the character encodings that are to be used for the form submission.
    func `acceptCharset`(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "acceptCharset", value: { value().description }))
    }

    ///Specifies the URL of the file that will process the input control when the form is submitted.
    func `action`(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "action", value: { value().description }))
    }

    ///Specifies whether the form should have autocomplete enabled.
    func `autocomplete`(_ value: @autoclosure @escaping () -> Unit.Toggle) -> Self {
        attribute(.init(name: "autocomplete", value: { value().description }))
    }

    ///Specifies how the form data should be encoded when submitting it to the server.
    func `enctype`(_ value: @autoclosure @escaping () -> Unit.FormEncType) -> Self {
        attribute(.init(name: "enctype", value: { value().description }))
    }

    ///Specifies the HTTP method to use when sending form data.
    func `method`(_ value: @autoclosure @escaping () -> Unit.FormMethod) -> Self {
        attribute(.init(name: "method", value: { value().description }))
    }

    ///Specifies the name of the form.
    func `name`(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "name", value: { value().description }))
    }

    ///Specifies that the form-data should not be validated on submission.
    func `novalidate`(_ value: @autoclosure @escaping () -> Bool) -> Self {
        attribute(.init(name: "novalidate", value: { value().description }))
    }

    ///Specifies where to display the response after submitting the form.
    func `target`(_ value: @autoclosure @escaping () -> Unit.Target) -> Self {
        attribute(.init(name: "target", value: { value().description }))
    }

}