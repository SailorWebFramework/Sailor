//
//  File.swift
//  
//
//  Created by Joshua Davis on 10/3/23.
//

import Foundation

@resultBuilder
public struct PageBuilder {
    public static func buildBlock(_ children: any Page...) -> any Operator {
        //TODO: do I add this back?
        if children.count == 1,
           let list = children.first as? List
        {
            return list
        }

        return List(children)
    }
    
    public static func buildOptional(_ component: (any Operator)?) -> any Operator {
        // if the if is without an else place a dummy div for reconcelliation
        guard let component = component else { return Conditional([Div()]) }
    
        return Conditional([Div { component }])
    }
    
    public static func buildEither(first component: any Operator) -> any Operator {
//        return List(Div( {component.children} ))
        return Conditional([Div { component }])
    }

    public static func buildEither(second component: any Operator) -> any Operator {
        return Conditional([Div { component }])
    }
    
}
