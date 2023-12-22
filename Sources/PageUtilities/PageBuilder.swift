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
//        if children.count == 1,
//           let list = children.first as? any Operator
//        {
//            return list
//        }
//
        return Container(children)
    }
    
    public static func buildOptional(_ component: (any Operator)?) -> any Operator {
        // if the if is without an else place a dummy div for reconcelliation
        guard let component = component else { return Conditional([Div()]) }
    
        return Conditional([Div{ component }])
    }
    
    public static func buildEither(first component: any Operator) -> any Operator {
//        return List(Div( {component.children} ))
        return Conditional([Div{ component }])
    }

    public static func buildEither(second component: any Operator) -> any Operator {
        return Conditional([Div{ component }])
    }
    
    // TODO: remove the list if there is only one child and put it as a Div
    // I think the problem is it runs through the build function and adds the node before it gets here
//    private static func checkAndRemoveSingleListElement(from component: any Page) -> any Page {
//        guard let component = component as? List else { return component }
//
//
////        if component.children.count == 1,
////           let first = component.children.first {
////            return first
////        }
//
//        return component
////        return Div(component.children)
//    }
    
}
