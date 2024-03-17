// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Button.swift
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

/// The button element represents a clickable button.
public struct Button: Element {
    /// name of the html tag associated with this type
    public static var name: String { "button" }

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

    public init() {  
        self.init(bodyValue: nil)
    }


    public init(@PageBuilder content: @escaping () -> any Operator) {
        self.init(bodyValue: content)
    }


}

// MARK: - Attributes
public extension Button {
    ///Specifies that the button should automatically get focus when the page loads.
    func autofocus(_ value: Bool) -> Self {
        attribute(.init(name: "autofocus", value: value.description))
    }

    ///Specifies that the button should be disabled.
    func disabled(_ value: Bool) -> Self {
        attribute(.init(name: "disabled", value: value.description))
    }

    ///Specifies one or more forms the button belongs to.
    func form(_ value: String) -> Self {
        attribute(.init(name: "form", value: value.description))
    }

    ///Specifies the URL of the file that will process the input control when the form is submitted.
    func formaction(_ value: String) -> Self {
        attribute(.init(name: "formaction", value: value.description))
    }

    ///Specifies how the form data should be encoded when submitting it to the server.
    func formenctype(_ value: Unit.FormEncType) -> Self {
        attribute(.init(name: "formenctype", value: value.description))
    }

    ///Specifies the HTTP method to use when sending form data.
    func formmethod(_ value: Unit.FormMethod) -> Self {
        attribute(.init(name: "formmethod", value: value.description))
    }

    ///Specifies that the form-data should not be validated on submission.
    func formnovalidate(_ value: Bool) -> Self {
        attribute(.init(name: "formnovalidate", value: value.description))
    }

    ///Specifies where to display the response after submitting the form.
    func formtarget(_ value: Unit.Target) -> Self {
        attribute(.init(name: "formtarget", value: value.description))
    }

    ///Specifies the name of the button.
    func name(_ value: String) -> Self {
        attribute(.init(name: "name", value: value.description))
    }

    ///Specifies the type of button.
    func type(_ value: Unit.ButtonType) -> Self {
        attribute(.init(name: "type", value: value.description))
    }

    ///Specifies the initial value of the button.
    func value(_ value: String) -> Self {
        attribute(.init(name: "value", value: value.description))
    }

}