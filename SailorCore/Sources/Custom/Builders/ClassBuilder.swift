//
//  ClassBuilder.swift
//
//
//  Created by Joshua Davis on 4/13/24.
//

import Sailboat

@resultBuilder
public struct ClassBuilder {
    
    public static func buildArray(_ components: [any DynamicClass]) -> any DynamicClassContainer  {
        components.reduce("") { "\($0) \($1.description)" }
    }
    
    public static func buildBlock(_ components: (any DynamicClass)...) -> any DynamicClassContainer  {
        components.reduce("") { "\($0) \($1.description)" }
    }
    
    public static func buildOptional(_ component: (any DynamicClassContainer)?) -> any DynamicClassContainer  {
        return component ?? ""
    }
    
    public static func buildEither(first component: any DynamicClassContainer) -> any DynamicClassContainer {
        return component
    }

    public static func buildEither(second component: any DynamicClassContainer) -> any DynamicClassContainer {
        return component
    }
          
}
