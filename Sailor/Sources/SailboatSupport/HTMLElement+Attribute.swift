//
//  File.swift
//  
//
//  Created by Joshua Davis on 1/19/24.
//

import Sailboat

extension HTMLElement where ElementAttributeGroup: GlobalAttributeGroup {
    
    //MARK- ATTRIBUTES
    public func style(_ properties: Style.Property...) -> Self {
        return style(Style(properties))
    }

    public func style(_ style: Style) -> Self {
        return attribute(.style(style))
    }

//    public func attribute(_ value: Attribute) -> Self {
//        if attributes[value.name] == value.value { return self }
//
//        var copy = self
//        copy.attributes[value.name] = value.value
//        return copy
//        
//    }
}
