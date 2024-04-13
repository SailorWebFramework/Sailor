// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Unit+InputType.swift
//  
//  Created by Joshua Davis on 10/6/23.
//

extension Unit {
    public struct InputType: Equatable {
        var value: String

        public var description: String {
            self.value
        }

        init(_ value: String) {
            self.value = value
        }

        ///A clickable button.
        public static var `button`: Self {
            return .init("button")
        }

        ///A checkbox.
        public static var `checkbox`: Self {
            return .init("checkbox")
        }

        ///A color picker.
        public static var `color`: Self {
            return .init("color")
        }

        ///A date picker.
        public static var `date`: Self {
            return .init("date")
        }

        ///A date and time picker.
        public static var `datetimeLocal`: Self {
            return .init("datetime-local")
        }

        ///An email input.
        public static var `email`: Self {
            return .init("email")
        }

        ///A file input.
        public static var `file`: Self {
            return .init("file")
        }

        ///A hidden input.
        public static var `hidden`: Self {
            return .init("hidden")
        }

        ///An image input.
        public static var `image`: Self {
            return .init("image")
        }

        ///A month picker.
        public static var `month`: Self {
            return .init("month")
        }

        ///A number input.
        public static var `number`: Self {
            return .init("number")
        }

        ///A password input.
        public static var `password`: Self {
            return .init("password")
        }

        ///A radio button.
        public static var `radio`: Self {
            return .init("radio")
        }

        ///A range input.
        public static var `range`: Self {
            return .init("range")
        }

        ///A reset button.
        public static var `reset`: Self {
            return .init("reset")
        }

        ///A search input.
        public static var `search`: Self {
            return .init("search")
        }

        ///A submit button.
        public static var `submit`: Self {
            return .init("submit")
        }

        ///A telephone input.
        public static var `tel`: Self {
            return .init("tel")
        }

        ///A text input.
        public static var `text`: Self {
            return .init("text")
        }

        ///A time picker.
        public static var `time`: Self {
            return .init("time")
        }

        ///A URL input.
        public static var `url`: Self {
            return .init("url")
        }

        ///A week picker.
        public static var `week`: Self {
            return .init("week")
        }


    }
}
