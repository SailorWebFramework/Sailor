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

    public static func buildArray(_ components: [any Page]) -> any Fragment {
        return List(components, hash: 0)
    }
    
    public static func buildBlock(_ components: any Page...) -> any Fragment  {
        return List(components, hash: 0)
    }
            
    public static func buildOptional(_ component: (any Fragment)?) -> any Fragment {
        guard let component = component else {
//            print("OPTIONAL \(-1)")
            return List([], hash: -1)
        }
        
        return component
    }
    
    public static func buildEither(first component: any Fragment) -> any Fragment {
        if let component = component as? List {
//            print("FIRST \((component.hash << 1)+1)")
            // TODO: add then shift?
            return List(component.children, hash: (component.hash << 1) + 1)
        }
        
        return component
    }

    public static func buildEither(second component: any Fragment) -> any Fragment {
        if let component = component as? List {
//            print("SECOND \((component.hash << 1))")
            return List(component.children, hash: (component.hash << 1))
        }

        return component
    }
    
}
