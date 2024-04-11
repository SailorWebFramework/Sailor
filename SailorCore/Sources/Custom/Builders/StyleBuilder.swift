//
//  StyleBuilder.swift
//  
//
//  Created by Joshua Davis on 3/29/24.
//

import Sailboat

@resultBuilder
public struct StyleBuilder {
    
    public static func buildArray(_ components: [any StyleAdjacent]) -> Style {
        return Style(components)
    }
    
    public static func buildBlock(_ components: (any StyleAdjacent)...) -> Style  {
        return Style(components)
    }
    
    public static func buildOptional(_ component: Style?) -> Style {
        return component ?? Style.none()
    }
    
    public static func buildEither(first component: Style) -> Style {
        return component
    }

    public static func buildEither(second component: Style) -> Style {
        return component
    }
          
}
