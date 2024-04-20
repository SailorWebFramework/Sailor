// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  TextArea.swift
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

/// The textarea element represents a multiline plain text edit control for the element's raw value.
public struct TextArea: BodyElement {
    /// name of the html tag associated with this type
    public static var name: String { "textarea" }

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
public extension TextArea {
    ///Specifies whether the form control should have autocomplete enabled.
    func `autocomplete`(_ value: (@escaping () -> Unit.Toggle)) -> Self {
        attribute(.init(name: "autocomplete", value: { value().description }))
    }

    ///Specifies that the form control should automatically get focus when the page is loaded.
    func `autofocus`(_ value: (@escaping () -> Bool)) -> Self {
        attribute(.init(name: "autofocus", value: { value().description }))
    }

    ///The visible width of the text control, in average character widths.
    func `cols`(_ value: (@escaping () -> Int)) -> Self {
        attribute(.init(name: "cols", value: { value().description }))
    }

    ///Specifies that the form control is disabled.
    func `disabled`(_ value: (@escaping () -> Bool)) -> Self {
        attribute(.init(name: "disabled", value: { value().description }))
    }

    ///The form element that the textarea element is associated with (its form owner).
    func `form`(_ value: (@escaping () -> String)) -> Self {
        attribute(.init(name: "form", value: { value().description }))
    }

    ///The maximum number of characters (UTF-16 code units) that the user can enter.
    func `maxlength`(_ value: (@escaping () -> Int)) -> Self {
        attribute(.init(name: "maxlength", value: { value().description }))
    }

    ///The name of the textarea element.
    func `name`(_ value: (@escaping () -> String)) -> Self {
        attribute(.init(name: "name", value: { value().description }))
    }

    ///A hint to the user of what can be entered in the control.
    func `placeholder`(_ value: (@escaping () -> String)) -> Self {
        attribute(.init(name: "placeholder", value: { value().description }))
    }

    ///Specifies that the user cannot modify the form control.
    func `readonly`(_ value: (@escaping () -> Bool)) -> Self {
        attribute(.init(name: "readonly", value: { value().description }))
    }

    ///Specifies that the user must fill in a value before submitting a form.
    func `required`(_ value: (@escaping () -> Bool)) -> Self {
        attribute(.init(name: "required", value: { value().description }))
    }

    ///The visible height of the text control, in lines.
    func `rows`(_ value: (@escaping () -> Int)) -> Self {
        attribute(.init(name: "rows", value: { value().description }))
    }

    ///Specifies how the control wraps text.
    func `wrap`(_ value: (@escaping () -> Unit.TextWrap)) -> Self {
        attribute(.init(name: "wrap", value: { value().description }))
    }

}