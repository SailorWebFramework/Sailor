//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/16/23.
//

import Foundation

extension HTMLElement {
    
    public func style(_ style: Style) -> any Page {
        var copy = self
        copy.attributes[.style] = style
        return copy
    }
    
    public func attribute(_ type: Attribute, value: some AttributeValue) -> any Page {
        var copy = self
        copy.attributes[type] = value
        return copy
    }
    
}
