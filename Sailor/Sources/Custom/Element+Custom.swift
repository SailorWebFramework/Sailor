//
//  File.swift
//  
//
//  Created by Joshua Davis on 2/9/24.
//

import Sailboat

public extension Element {
    ///One or more class names defined as a class style.
    func classes(_ values: String...) -> Self {
        attribute(.init(name: "class", value: values.joined(separator: " ") + " "), override: false)
    }
    
    // TODO: more custom methods?
    // ...
}
