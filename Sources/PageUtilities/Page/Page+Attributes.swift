//
//  File.swift
//  
//
//  Created by Joshua Davis on 10/6/23.
//

import Foundation

extension Page {
//    public func style(_ style: Style) -> Self {
//        var copy = self
//
//        if let copyStyle = copy.attributes[.style] as? Style {
//            copy.attributes[.style] = copyStyle + style
//
//        } else {
//            copy.attributes[.style] = style
//
//        }
//
//        return copy
//    }

    public func attribute(_ type: Attribute, value: some AttributeValue) -> any Page {
        Div {
            self
        }.attribute(type, value: value)
    }
    
    public func style(_ style: Style) -> any Page {
        self.attribute(.style, value: style)
    }

    public func style(_ properties: Style.Property...) -> any Page {
        return style(Style(properties))
    }


    

}
