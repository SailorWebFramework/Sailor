//
//  Element+Style.swift
//
//
//  Created by Joshua Davis on 3/8/24.
//

import Sailboat

public extension Element {
    // TODO: make a style builder
    func style(@StyleBuilder _ completion: @escaping () -> Style) -> Self {
        var copy = self
        
        copy.attributes["style"] = completion
        
        return copy
    }
    
    // TODO: stylebuilder doesnt work
//    func styles(@StyleBuilder _ builder: @escaping  () -> [Style.Property]) -> Self {
//        var copy = self
//        
//        copy.attributes["style"] = {
//            Style(builder())
//        }
//        
//        return copy
//    }
    
    // TODO: this should work once you put properties in style as well as Style.Property
//    func styles(_ builder: @escaping (Style) -> Style) -> Self {
//        var copy = self
//
//        copy.attributes["style"] = {
//            builder(copy.attributes["style"] ?? Style())
//        }
//
//        return copy
//    }
}
