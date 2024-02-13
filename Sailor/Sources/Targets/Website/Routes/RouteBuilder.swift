//
//  RouteBuilder.swift
//  
//
//  Created by Joshua Davis on 2/12/24.
//

import Sailboat

@resultBuilder
public struct RouteBuilder {
    public static func buildBlock(_ children: Route...) -> any Operator {
        return List(children)
    }
    
//    public static func buildOptional(_ component: (Route?) -> any Operator {
//        guard let component = component else { return Conditional([]) } // or? Conditional([Div()])
//
//        return Conditional(component.children)
//    }
//
//    public static func buildEither(first component: any Operator) -> any Operator {
//        return Conditional(component.children)
//    }
//
//    public static func buildEither(second component: any Operator) -> any Operator {
//        return Conditional(component.children)
//    }
    
}
