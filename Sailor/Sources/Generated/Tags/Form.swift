// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Form.swift
//
//  Created by Joshua Davis.
//

import Foundation
import Sailboat

/// The form element represents a document section that contains interactive controls to submit information to a web server.
public struct Form: Element {
    /// name of the html tag associated with this type
    public static var name: String { "form" }

    /// unique identifier for this html element
    public var id: ElementID

    /// attributes associated with this type
    public var attributes: [String: String]

    /// events associated with this type
    public var events: [String: (EventResult) -> Void]

    /// content that is contained by this html element
    public var content: (() -> any Operator)?

    public var renderer: any Renderable

    private init(bodyValue: (() -> any Operator)?) {
        let id = UUID().uuidString
        self.id = id
        self.attributes = [:]
        self.events = [:]
        self.content = bodyValue
        self.renderer = JSNode(named: Self.name, elementID: id)
        //SailboatGlobal.manager.managedPages.elements[id] = self
    }

    public init(@PageBuilder content: @escaping () -> any Operator) {
        self.init(bodyValue: content)
    }


}

// MARK: - Attributes
public extension Form {
    ///Specifies the character encodings that are to be used for the form submission.
    func acceptCharset(_ value: String) -> Self {
        attribute(.init(name: "acceptCharset", value: value.description))
    }

    ///Specifies the URL of the file that will process the input control when the form is submitted.
    func action(_ value: String) -> Self {
        attribute(.init(name: "action", value: value.description))
    }

    ///Specifies whether the form should have autocomplete enabled.
    func autocomplete(_ value: Unit.Toggle) -> Self {
        attribute(.init(name: "autocomplete", value: value.description))
    }

    ///Specifies how the form data should be encoded when submitting it to the server.
    func enctype(_ value: Unit.FormEncType) -> Self {
        attribute(.init(name: "enctype", value: value.description))
    }

    ///Specifies the HTTP method to use when sending form data.
    func method(_ value: Unit.FormMethod) -> Self {
        attribute(.init(name: "method", value: value.description))
    }

    ///Specifies the name of the form.
    func name(_ value: String) -> Self {
        attribute(.init(name: "name", value: value.description))
    }

    ///Specifies that the form-data should not be validated on submission.
    func novalidate(_ value: Bool) -> Self {
        attribute(.init(name: "novalidate", value: value.description))
    }

    ///Specifies where to display the response after submitting the form.
    func target(_ value: Unit.Target) -> Self {
        attribute(.init(name: "target", value: value.description))
    }

}