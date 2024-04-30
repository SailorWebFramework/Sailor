//
//  File.swift
//  
//
//  Created by Joshua Davis on 4/22/24.
//

import Sailboat

public extension HTML.Input {
    
    static func Checkbox(_ isChecked: Binding<Bool>) -> HTML.Input {
        Self.init(isChecked, name: "checkbox")
    }
    
    static func Color(_ value: Binding<String>) -> HTML.Input {
        Self.init(type: .color, value)
    }
    
    static func Date(_ value: Binding<String>) -> HTML.Input {
        Self.init(type: .date, value)
    }
    
    static func File(_ value: Binding<String>) -> HTML.Input {
        Self.init(type: .file, value)
    }
    
    static func Submit(_ value: Binding<String>) -> HTML.Input {
        Self.init(type: .submit, value)
    }
    
    static func DateTimeLocal(_ value: Binding<String>) -> HTML.Input {
        Self.init(type: .datetimeLocal, value)
    }
    
    static func Email(_ value: Binding<String>) -> HTML.Input {
        Self.init(type: .email, value)
    }
    
    static func Number(_ value: Binding<String>) -> HTML.Input {
        Self.init(type: .number, value)
    }
    
    static func Password(_ value: Binding<String>) -> HTML.Input {
        Self.init(type: .password, value)
    }
    
    static func Search(_ value: Binding<String>) -> HTML.Input {
        Self.init(type: .search, value)
    }
    
    static func Telephone(_ value: Binding<String>) -> HTML.Input {
        Self.init(type: .tel, value)
    }
    
    static func Radio(_ currentValue: Binding<String>, value: @autoclosure @escaping () -> String) -> HTML.Input {
        Self.init(radioValue: currentValue, value: value)
    }
    
    static func Range(_ value: Binding<String>) -> HTML.Input {
        Self.init(type: .range, value)
    }
    
    static func Url(_ value: Binding<String>) -> HTML.Input {
        Self.init(type: .url, value)
    }
    
    static func Time(_ value: Binding<String>) -> HTML.Input {
        Self.init(type: .time, value)
    }
    
    static func Week(_ value: Binding<String>) -> HTML.Input {
        Self.init(type: .week, value)
    }
    
    static func Text(_ value: Binding<String>) -> HTML.Input {
        Self.init(type: .text, value)
    }

    internal init(_ value: Binding<Bool>, name: String) {
        self.init(bodyValue: nil)
        
        self.attributes[".checked"] = { value.wrappedValue }
        self.attributes["type"] = { name }
        self.events["input:checked"] = { eventResult in
            guard case let .bool(bindedValue) = eventResult else { return }
            value.set(bindedValue)
        }
    }
    
    internal init(radioValue: Binding<String>, value: @escaping () -> String) {
        self.init(bodyValue: nil)

        self.attributes["value"] = value
        self.attributes["type"] = { "radio" }
        
        self.attributes[".checked"] = { value() == radioValue.wrappedValue.description }

        self.events["input:value"] = { eventResult in
            guard case let .string(bindedValue) = eventResult else { return }
            radioValue.set(bindedValue)
        }
    }
    
    internal init(type: @autoclosure @escaping () -> Unit.InputType, _ value: Binding<String>) {
        self.init(bodyValue: nil)

        self.attributes[".value"] = { value.wrappedValue.description }
        self.attributes["type"] = { type().description }
        self.events["input:value"] = { eventResult in
            guard case let .string(bindedValue) = eventResult else { return }
            value.set(bindedValue)
        }
    }

}
