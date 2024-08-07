// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Input.swift
//


import Sailboat
import SailorShared

#if os(WASI)
import SailorWeb
#else
// if any other target are created
#endif

extension HTML {
    /// The input element represents a typed data field, usually with a form control to allow the user to edit the data.
    public struct Input: BodyElement {
        /// name of the html tag associated with this type
        @_spi(Private) public static var name: String { "input" }

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


    }
}
// MARK: - Attributes
public extension HTML.Input {
    ///Specifies the types of files that the server accepts (only for type=&quot;file&quot;).
    func `accept`(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "accept", value: { value().description }))
    }

    ///The alternative text for the image specified by src when the input type is image.
    func `alt`(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "alt", value: { value().description }))
    }

    ///Specifies whether the input element should have autocomplete enabled.
    func `autocomplete`(_ value: @autoclosure @escaping () -> Unit.Toggle) -> Self {
        attribute(.init(name: "autocomplete", value: { value().description }))
    }

    ///Specifies that the input element should automatically get focus when the page loads.
    func `autofocus`(_ value: @autoclosure @escaping () -> Bool) -> Self {
        attribute(.init(name: "autofocus", value: { value().description }))
    }

    ///Specifies that an input element should be pre-selected when the page loads (for type=&quot;radio&quot; or type=&quot;checkbox&quot;).
    func `checked`(_ value: @autoclosure @escaping () -> Bool) -> Self {
        attribute(.init(name: "checked", value: { value().description }))
    }

    ///Specifies that the input element should be directionally isolated from its surrounding content.
    func `dirname`(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "dirname", value: { value().description }))
    }

    ///Specifies that the input element should be disabled.
    func `disabled`(_ value: @autoclosure @escaping () -> Bool) -> Self {
        attribute(.init(name: "disabled", value: { value().description }))
    }

    ///Specifies one or more forms the input element belongs to.
    func `form`(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "form", value: { value().description }))
    }

    ///Specifies the URL of the file that will process the input control when the form is submitted.
    func `formaction`(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "formaction", value: { value().description }))
    }

    ///Specifies how the form data should be encoded when submitting it to the server.
    func `formenctype`(_ value: @autoclosure @escaping () -> Unit.FormEncType) -> Self {
        attribute(.init(name: "formenctype", value: { value().description }))
    }

    ///Specifies the HTTP method to use when sending form data.
    func `formmethod`(_ value: @autoclosure @escaping () -> Unit.FormMethod) -> Self {
        attribute(.init(name: "formmethod", value: { value().description }))
    }

    ///Specifies that the form-data should not be validated on submission.
    func `formnovalidate`(_ value: @autoclosure @escaping () -> Bool) -> Self {
        attribute(.init(name: "formnovalidate", value: { value().description }))
    }

    ///Specifies where to display the response after submitting the form.
    func `formtarget`(_ value: @autoclosure @escaping () -> Unit.Target) -> Self {
        attribute(.init(name: "formtarget", value: { value().description }))
    }

    ///The height of the image input (only for type=&quot;image&quot;).
    func `height`(_ value: @autoclosure @escaping () -> Int) -> Self {
        attribute(.init(name: "height", value: { value().description }))
    }

    ///Specifies a datalist for the input element.
    func `list`(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "list", value: { value().description }))
    }

    ///Specifies the maximum value for the input element.
    func `max`(_ value: @autoclosure @escaping () -> Unit.InputQuantity) -> Self {
        attribute(.init(name: "max", value: { value().description }))
    }

    ///Specifies the maximum number of characters allowed in the input element.
    func `maxlength`(_ value: @autoclosure @escaping () -> Int) -> Self {
        attribute(.init(name: "maxlength", value: { value().description }))
    }

    ///Specifies the minimum value for the input element.
    func `min`(_ value: @autoclosure @escaping () -> Unit.InputQuantity) -> Self {
        attribute(.init(name: "min", value: { value().description }))
    }

    ///Specifies the minimum number of characters allowed in the input element.
    func `minlength`(_ value: @autoclosure @escaping () -> Int) -> Self {
        attribute(.init(name: "minlength", value: { value().description }))
    }

    ///Specifies that the user is allowed to enter more than one value in the input element.
    func `multiple`(_ value: @autoclosure @escaping () -> Bool) -> Self {
        attribute(.init(name: "multiple", value: { value().description }))
    }

    ///Specifies the name of the input element.
    func `name`(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "name", value: { value().description }))
    }

    ///Specifies a regular expression that the input element's value is checked against.
    func `pattern`(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "pattern", value: { value().description }))
    }

    ///Specifies a short hint that describes the expected value of the input element.
    func `placeholder`(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "placeholder", value: { value().description }))
    }

    ///Specifies the target of the popover.
    func `popovertarget`(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "popovertarget", value: { value().description }))
    }

    ///Specifies the action of the popover target.
    func `popovertargetaction`(_ value: @autoclosure @escaping () -> Unit.PopoverTargetAction) -> Self {
        attribute(.init(name: "popovertargetaction", value: { value().description }))
    }

    ///Specifies that the input element is read only.
    func `readonly`(_ value: @autoclosure @escaping () -> Bool) -> Self {
        attribute(.init(name: "readonly", value: { value().description }))
    }

    ///Specifies that the input element must be filled out before submitting the form.
    func `required`(_ value: @autoclosure @escaping () -> Bool) -> Self {
        attribute(.init(name: "required", value: { value().description }))
    }

    ///Specifies the width of the input element, in characters.
    func `size`(_ value: @autoclosure @escaping () -> Int) -> Self {
        attribute(.init(name: "size", value: { value().description }))
    }

    ///Specifies the URL of the image to use as a submit button (only for type=&quot;image&quot;).
    func `src`(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "src", value: { value().description }))
    }

    ///Specifies the legal number intervals for the input element.
    func `step`(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "step", value: { value().description }))
    }

    ///Specifies the type of input element to display.
    func `type`(_ value: @autoclosure @escaping () -> Unit.InputType) -> Self {
        attribute(.init(name: "type", value: { value().description }))
    }

    ///Specifies the initial value of the input element.
    func `value`(_ value: @autoclosure @escaping () -> String) -> Self {
        attribute(.init(name: "value", value: { value().description }))
    }

    ///The width of the image input (only for type=&quot;image&quot;).
    func `width`(_ value: @autoclosure @escaping () -> Int) -> Self {
        attribute(.init(name: "width", value: { value().description }))
    }

}