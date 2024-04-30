//
//  StyleBuilder.swift
//  
//
//  Created by Joshua Davis on 3/29/24.
//

import Sailboat

@resultBuilder
public struct StyleBuilder {
    
    public static func buildArray(_ components: [any Style]) -> any StyleContainer {
        return StyleGroup(components)
    }
    
    public static func buildBlock(_ components: (any Style)...) -> any StyleContainer  {
        return StyleGroup(components)
    }
    
    public static func buildOptional(_ component: (any StyleContainer)?) -> any StyleContainer  {
        return component ?? StyleGroup([])
    }
    
    public static func buildEither(first component: any StyleContainer) -> any StyleContainer {
        return component
    }

    public static func buildEither(second component: any StyleContainer) -> any StyleContainer {
        return component
    }
          
}
