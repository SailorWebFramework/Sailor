//
//  PageBuilder.swift
//  
//
//  Created by Joshua Davis on 10/3/23.
//

import Sailboat

@resultBuilder
public struct PageBuilder {
    
    // TODO: should this allowed , should it be stateful?

    public static func buildArray(_ components: [any Page]) -> any Operator {
        return List(components, hash: 0)
    }
    
    public static func buildBlock(_ components: any Page...) -> any Operator  {
        return List(components, hash: 0)
    }
            
    public static func buildOptional(_ component: (any Operator)?) -> any Operator {
        guard let component = component else {
//            print("HASHED OPTIONAL \(-1)")
            return List([], hash: -1)
        }
        
        return component
    }
    
    public static func buildEither(first component: any Operator) -> any Operator {
        if let component = component as? List {
//            print("HASHED FIRST \((component.hash << 1)+1)")
            return List(component.children, hash: (component.hash << 1) + 1)
        }
        
        return component
    }

    public static func buildEither(second component: any Operator) -> any Operator {
        if let component = component as? List {
//            print("HASHED SECOND \((component.hash << 1))")
            return List(component.children, hash: (component.hash << 1))
        }

        return component
    }
    
}