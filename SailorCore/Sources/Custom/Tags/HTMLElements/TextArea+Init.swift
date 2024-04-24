//
//  File.swift
//  
//
//  Created by Joshua Davis on 4/22/24.
//

import Sailboat

public extension HTML.Textarea {
    
    init(_ value: Binding<String>) {
        self.init(bodyValue: nil)

        self.attributes[".value"] = { value.wrappedValue.description }
        self.events["input:value"] = { eventResult in
            guard case let .string(bindedValue) = eventResult else { return }
            value.set(bindedValue)
        }
    }
}
