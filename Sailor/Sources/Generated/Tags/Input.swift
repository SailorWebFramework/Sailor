// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Input.swift
//
//  Created by Joshua Davis.
//

import Sailboat

/// The input element represents a typed data field, usually with a form control to allow the user to edit the data.
public struct Input: Element {
    public struct ElementAttributeGroup: AttributeGroup, GlobalAttributeGroup {
        public let name: String
        public let value: String
        
        public init(name: String, value: String) {
            self.name = name
            self.value = value
        }

        ///Specifies the types of files that the server accepts (only for type=&quot;file&quot;).
        static func accept(_ value: String) -> Self {
            .init(name: "accept", value: value.description)
        }

        ///The alternative text for the image specified by src when the input type is image.
        static func alt(_ value: String) -> Self {
            .init(name: "alt", value: value.description)
        }

        ///Specifies whether the input element should have autocomplete enabled.
        static func autocomplete(_ value: Unit.Toggle) -> Self {
            .init(name: "autocomplete", value: value.description)
        }

        ///Specifies that the input element should automatically get focus when the page loads.
        static func autofocus(_ value: Bool) -> Self {
            .init(name: "autofocus", value: value.description)
        }

        ///Specifies that an input element should be pre-selected when the page loads (for type=&quot;radio&quot; or type=&quot;checkbox&quot;).
        static func checked(_ value: Bool) -> Self {
            .init(name: "checked", value: value.description)
        }

        ///Specifies that the input element should be directionally isolated from its surrounding content.
        static func dirname(_ value: String) -> Self {
            .init(name: "dirname", value: value.description)
        }

        ///Specifies that the input element should be disabled.
        static func disabled(_ value: Bool) -> Self {
            .init(name: "disabled", value: value.description)
        }

        ///Specifies one or more forms the input element belongs to.
        static func form(_ value: String) -> Self {
            .init(name: "form", value: value.description)
        }

        ///Specifies the URL of the file that will process the input control when the form is submitted.
        static func formaction(_ value: String) -> Self {
            .init(name: "formaction", value: value.description)
        }

        ///Specifies how the form data should be encoded when submitting it to the server.
        static func formenctype(_ value: Unit.FormEncType) -> Self {
            .init(name: "formenctype", value: value.description)
        }

        ///Specifies the HTTP method to use when sending form data.
        static func formmethod(_ value: Unit.FormMethod) -> Self {
            .init(name: "formmethod", value: value.description)
        }

        ///Specifies that the form-data should not be validated on submission.
        static func formnovalidate(_ value: Bool) -> Self {
            .init(name: "formnovalidate", value: value.description)
        }

        ///Specifies where to display the response after submitting the form.
        static func formtarget(_ value: Unit.Target) -> Self {
            .init(name: "formtarget", value: value.description)
        }

        ///The height of the image input (only for type=&quot;image&quot;).
        static func height(_ value: Int) -> Self {
            .init(name: "height", value: value.description)
        }

        ///Specifies a datalist for the input element.
        static func list(_ value: String) -> Self {
            .init(name: "list", value: value.description)
        }

        ///Specifies the maximum value for the input element.
        static func max(_ value: Unit.InputQuantity) -> Self {
            .init(name: "max", value: value.description)
        }

        ///Specifies the maximum number of characters allowed in the input element.
        static func maxlength(_ value: Int) -> Self {
            .init(name: "maxlength", value: value.description)
        }

        ///Specifies the minimum value for the input element.
        static func min(_ value: Unit.InputQuantity) -> Self {
            .init(name: "min", value: value.description)
        }

        ///Specifies the minimum number of characters allowed in the input element.
        static func minlength(_ value: Int) -> Self {
            .init(name: "minlength", value: value.description)
        }

        ///Specifies that the user is allowed to enter more than one value in the input element.
        static func multiple(_ value: Bool) -> Self {
            .init(name: "multiple", value: value.description)
        }

        ///Specifies the name of the input element.
        static func name(_ value: String) -> Self {
            .init(name: "name", value: value.description)
        }

        ///Specifies a regular expression that the input element's value is checked against.
        static func pattern(_ value: String) -> Self {
            .init(name: "pattern", value: value.description)
        }

        ///Specifies a short hint that describes the expected value of the input element.
        static func placeholder(_ value: String) -> Self {
            .init(name: "placeholder", value: value.description)
        }

        ///Specifies the target of the popover.
        static func popovertarget(_ value: String) -> Self {
            .init(name: "popovertarget", value: value.description)
        }

        ///Specifies the action of the popover target.
        static func popovertargetaction(_ value: Unit.PopoverTargetAction) -> Self {
            .init(name: "popovertargetaction", value: value.description)
        }

        ///Specifies that the input element is read only.
        static func readonly(_ value: Bool) -> Self {
            .init(name: "readonly", value: value.description)
        }

        ///Specifies that the input element must be filled out before submitting the form.
        static func required(_ value: Bool) -> Self {
            .init(name: "required", value: value.description)
        }

        ///Specifies the width of the input element, in characters.
        static func size(_ value: Int) -> Self {
            .init(name: "size", value: value.description)
        }

        ///Specifies the URL of the image to use as a submit button (only for type=&quot;image&quot;).
        static func src(_ value: String) -> Self {
            .init(name: "src", value: value.description)
        }

        ///Specifies the legal number intervals for the input element.
        static func step(_ value: String) -> Self {
            .init(name: "step", value: value.description)
        }

        ///Specifies the type of input element to display.
        static func type(_ value: Unit.InputType) -> Self {
            .init(name: "type", value: value.description)
        }

        ///Specifies the initial value of the input element.
        static func value(_ value: String) -> Self {
            .init(name: "value", value: value.description)
        }

        ///The width of the image input (only for type=&quot;image&quot;).
        static func width(_ value: Int) -> Self {
            .init(name: "width", value: value.description)
        }

    }

    /// name of the html tag associated with this type
    public var name: String { "input" }

    /// attributes associated with this type
    public var attributes: [String: String]

    /// events associated with this type
    public var events: [String: (EventResult) -> Void]

    /// content that is contained by this html element
    public var content: TagContent

    public init(type: Unit.InputType, _ value: Binding<String>) {
        self.content = .text("")
        self.attributes = .init()
        self.events = .init()

        self.attributes["type"] = type.description
        self.attributes["value"] = value.wrappedValue.description
        self.events["input"] = { eventResult in
            guard case let .string(bindedValue) = eventResult else { return }
            value.set(bindedValue)
        }
        
    }

    public init(_ value: Binding<String>) {
        self.content = .text("")
        self.attributes = .init()
        self.events = .init()

        self.attributes["value"] = value.wrappedValue.description
        self.events["input"] = { eventResult in
            guard case let .string(bindedValue) = eventResult else { return }
            value.set(bindedValue)
        }
        
    }

}

// MARK: - Attributes
public extension Input {
    ///Specifies the types of files that the server accepts (only for type=&quot;file&quot;).
    func accept(_ value: String) -> Self {
        attribute(.init(name: "accept", value: value.description))
    }

    ///The alternative text for the image specified by src when the input type is image.
    func alt(_ value: String) -> Self {
        attribute(.init(name: "alt", value: value.description))
    }

    ///Specifies whether the input element should have autocomplete enabled.
    func autocomplete(_ value: Unit.Toggle) -> Self {
        attribute(.init(name: "autocomplete", value: value.description))
    }

    ///Specifies that the input element should automatically get focus when the page loads.
    func autofocus(_ value: Bool) -> Self {
        attribute(.init(name: "autofocus", value: value.description))
    }

    ///Specifies that an input element should be pre-selected when the page loads (for type=&quot;radio&quot; or type=&quot;checkbox&quot;).
    func checked(_ value: Bool) -> Self {
        attribute(.init(name: "checked", value: value.description))
    }

    ///Specifies that the input element should be directionally isolated from its surrounding content.
    func dirname(_ value: String) -> Self {
        attribute(.init(name: "dirname", value: value.description))
    }

    ///Specifies that the input element should be disabled.
    func disabled(_ value: Bool) -> Self {
        attribute(.init(name: "disabled", value: value.description))
    }

    ///Specifies one or more forms the input element belongs to.
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

    ///The height of the image input (only for type=&quot;image&quot;).
    func height(_ value: Int) -> Self {
        attribute(.init(name: "height", value: value.description))
    }

    ///Specifies a datalist for the input element.
    func list(_ value: String) -> Self {
        attribute(.init(name: "list", value: value.description))
    }

    ///Specifies the maximum value for the input element.
    func max(_ value: Unit.InputQuantity) -> Self {
        attribute(.init(name: "max", value: value.description))
    }

    ///Specifies the maximum number of characters allowed in the input element.
    func maxlength(_ value: Int) -> Self {
        attribute(.init(name: "maxlength", value: value.description))
    }

    ///Specifies the minimum value for the input element.
    func min(_ value: Unit.InputQuantity) -> Self {
        attribute(.init(name: "min", value: value.description))
    }

    ///Specifies the minimum number of characters allowed in the input element.
    func minlength(_ value: Int) -> Self {
        attribute(.init(name: "minlength", value: value.description))
    }

    ///Specifies that the user is allowed to enter more than one value in the input element.
    func multiple(_ value: Bool) -> Self {
        attribute(.init(name: "multiple", value: value.description))
    }

    ///Specifies the name of the input element.
    func name(_ value: String) -> Self {
        attribute(.init(name: "name", value: value.description))
    }

    ///Specifies a regular expression that the input element's value is checked against.
    func pattern(_ value: String) -> Self {
        attribute(.init(name: "pattern", value: value.description))
    }

    ///Specifies a short hint that describes the expected value of the input element.
    func placeholder(_ value: String) -> Self {
        attribute(.init(name: "placeholder", value: value.description))
    }

    ///Specifies the target of the popover.
    func popovertarget(_ value: String) -> Self {
        attribute(.init(name: "popovertarget", value: value.description))
    }

    ///Specifies the action of the popover target.
    func popovertargetaction(_ value: Unit.PopoverTargetAction) -> Self {
        attribute(.init(name: "popovertargetaction", value: value.description))
    }

    ///Specifies that the input element is read only.
    func readonly(_ value: Bool) -> Self {
        attribute(.init(name: "readonly", value: value.description))
    }

    ///Specifies that the input element must be filled out before submitting the form.
    func required(_ value: Bool) -> Self {
        attribute(.init(name: "required", value: value.description))
    }

    ///Specifies the width of the input element, in characters.
    func size(_ value: Int) -> Self {
        attribute(.init(name: "size", value: value.description))
    }

    ///Specifies the URL of the image to use as a submit button (only for type=&quot;image&quot;).
    func src(_ value: String) -> Self {
        attribute(.init(name: "src", value: value.description))
    }

    ///Specifies the legal number intervals for the input element.
    func step(_ value: String) -> Self {
        attribute(.init(name: "step", value: value.description))
    }

    ///Specifies the type of input element to display.
    func type(_ value: Unit.InputType) -> Self {
        attribute(.init(name: "type", value: value.description))
    }

    ///Specifies the initial value of the input element.
    func value(_ value: String) -> Self {
        attribute(.init(name: "value", value: value.description))
    }

    ///The width of the image input (only for type=&quot;image&quot;).
    func width(_ value: Int) -> Self {
        attribute(.init(name: "width", value: value.description))
    }

}