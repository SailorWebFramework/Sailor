//
//  Element+Style.swift
//
//
//  Created by Joshua Davis on 3/8/24.
//

import Sailboat

public extension Element {
    // TODO: make a style builder
    func styles(_ builder: @escaping () -> Style) -> Self {
        var copy = self
        
        copy.attributes["style"] = builder
        
        return copy
    }
}
