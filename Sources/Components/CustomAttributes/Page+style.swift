//
//  File.swift
//  
//
//  Created by Joshua Davis on 10/6/23.
//

import Foundation

extension Page {
    public func style(_ style: Style) -> Self {
        var copy = self
        
        if let copyStyle = copy.attributes[.style] as? Style {
            copy.attributes[.style] = copyStyle + style
            
        } else {
            copy.attributes[.style] = style
            
        }
        
        return copy
    }
    
    public func style(_ properties: Style.Property...) -> Self {
        return style(Style(properties))
    }
}
