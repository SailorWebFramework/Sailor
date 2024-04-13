// This file was autogenerated by Shipwright. DO NOT CHANGE.
//
//  Unit+CompatAuto.swift
//  
//  Created by Joshua Davis on 10/6/23.
//

extension Unit {
    public struct CompatAuto: Equatable {
        var value: String

        public var description: String {
            self.value
        }

        init(_ value: String) {
            self.value = value
        }

        ///The element is a search field.
        public static var `searchfield`: Self {
            return .init("searchfield")
        }

        ///The element is a text area.
        public static var `textarea`: Self {
            return .init("textarea")
        }

        ///The element is a checkbox.
        public static var `checkbox`: Self {
            return .init("checkbox")
        }

        ///The element is a radio button.
        public static var `radio`: Self {
            return .init("radio")
        }

        ///The element is a menu list.
        public static var `menulist`: Self {
            return .init("menulist")
        }

        ///The element is a list box.
        public static var `listbox`: Self {
            return .init("listbox")
        }

        ///The element is a meter.
        public static var `meter`: Self {
            return .init("meter")
        }

        ///The element is a progress bar.
        public static var `progressBar`: Self {
            return .init("progress-bar")
        }

        ///The element is a button.
        public static var `button`: Self {
            return .init("button")
        }


    }
}
