//
//  PageBuilder.swift
//  
//
//  Created by Joshua Davis on 10/3/23.
//

import Sailboat

@resultBuilder
public struct PageBuilder {
    
    public static func buildArray(_ components: [any Page]) -> any Fragment {
        return List(components)
    }

    public static func buildBlock(_ components: any Page...) -> any Fragment  {
        return List(components)
    }
        
    public static func buildOptional(_ component: (any Fragment)?) -> any Fragment {
        // this should be the dependencies of the conditional
        
        guard let component = component else { return Conditional([]) } // or? Conditional([Div()])

        return Conditional(component.children)
    }
    
    public static func buildEither(first component: any Fragment) -> any Fragment {
        return Conditional(component.children)
    }

    public static func buildEither(second component: any Fragment) -> any Fragment {
        return Conditional(component.children)
    }
    
}
