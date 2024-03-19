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
        
//    public static func buildPartialBlock(first: any Page) -> any Operator {
//        print("FIRST")
//        catchDependencies()
//        return List([first])
//    }
//
//    public static func buildPartialBlock(accumulated: any Operator, next: any Page) -> any Operator {
//        print("NEXT")
//        catchDependencies()
//
//        var copy = accumulated
//        copy.children.append(next)
//
//        return copy
//    }
//
//
//    public static func buildFinalResult(_ component: any Operator) -> any Operator {
//        print("DONE")
//        catchDependencies()
//
//        return component
//    }
    
    // Todo , do this?
//    static func buildExpression(_ expression: any Page) -> any Page {
//        return expression//TextString(expression)
//    }
    
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
