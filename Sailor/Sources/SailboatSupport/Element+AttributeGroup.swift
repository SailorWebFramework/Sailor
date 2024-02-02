//
//  File.swift
//  
//
//  Created by Joshua Davis on 1/19/24.
//

import Sailboat

extension Element where ElementAttributeGroup: GlobalAttributeGroup {
    
    //MARK- ATTRIBUTES
    public func style(_ properties: Style.Property...) -> Self {
        return style(Style(properties))
    }

    public func style(_ style: Style) -> Self {
        return self.attribute(ElementAttributeGroup(name: "style", value: style.description))
    }

}
