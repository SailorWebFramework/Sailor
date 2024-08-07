// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  GlobalAttributeGroup.swift
//  

import Sailboat

public extension Element {
    ///Defines a shortcut key to focus and activate an element (typically with an aditional modifier key based on browser), value is a single character that is the shortcut key.
    func accesskey(_ value: @autoclosure @escaping () -> Character) -> Self {
        attribute(.init(name: "accesskey", value: { value().description }))
    }

    ///Specifies wheather or not this element is editable or not.
    func contenteditable(_ value: @autoclosure @escaping () -> Bool) -> Self {
        attribute(.init(name: "contenteditable", value: { value().description }))
    }

    ///Stores custom data to the webiste to this element (name, value).
    func data(_ name: String, _ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "data-name", value: { value().description }))
    }

    ///Defines text direction of the content.
    func dir(_ value: @autoclosure @escaping () -> Unit.Direction) -> Self {
        attribute(.init(name: "dir", value: { value().description }))
    }

    ///Defines whether this element is draggable, often used for drag and drop operations.
    func draggable(_ value: @autoclosure @escaping () -> Unit.AutoBool) -> Self {
        attribute(.init(name: "draggable", value: { value().description }))
    }

    ///Allows the appearence of the enter key to be different on mobile.
    func enterkeyhint(_ value: @autoclosure @escaping () -> Unit.EnterKeyHint) -> Self {
        attribute(.init(name: "enterkeyhint", value: { value().description }))
    }

    ///Defines whether this element is hidden or not.
    func hidden(_ value: @autoclosure @escaping () -> Bool) -> Self {
        attribute(.init(name: "hidden", value: { value().description }))
    }

    ///Defines a unique identifier for the element.
    func id(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "id", value: { value().description }))
    }

    ///Disables element and all inner elements.
    func inert(_ value: @autoclosure @escaping () -> Bool) -> Self {
        attribute(.init(name: "inert", value: { value().description }))
    }

    ///Defines the input mode for the element when the keyboard is active.
    func inputmode(_ value: @autoclosure @escaping () -> Unit.InputMode) -> Self {
        attribute(.init(name: "inputmode", value: { value().description }))
    }

    ///Defines the language of the content.
    func lang(_ value: @autoclosure @escaping () -> Unit.Language) -> Self {
        attribute(.init(name: "lang", value: { value().description }))
    }

    ///Defines a popover element, it will be placed on top of the content. This element is invisible until it is called by another element witha popovertarget attribute.
    func popover(_ value: @autoclosure @escaping () -> Bool) -> Self {
        attribute(.init(name: "popover", value: { value().description }))
    }

    ///Defines whether the element should have spell checking enabled or not.
    func spellcheck(_ value: @autoclosure @escaping () -> Bool) -> Self {
        attribute(.init(name: "spellcheck", value: { value().description }))
    }

    ///Defines the tab order of the element.
    func tabindex(_ value: @autoclosure @escaping () -> Int) -> Self {
        attribute(.init(name: "tabindex", value: { value().description }))
    }

    ///Defines the title of the element, typically shown as a tooltip hint.
    func title(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "title", value: { value().description }))
    }

    ///Defines whether the content should be translated or not.
    func translate(_ value: @autoclosure @escaping () -> Unit.Question) -> Self {
        attribute(.init(name: "translate", value: { value().description }))
    }

}