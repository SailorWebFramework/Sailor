//
//  StyleBuilder.swift
//  
//
//  Created by Joshua Davis on 3/29/24.
//

import Sailboat

//@resultBuilder
//public struct StyleBuilder {
//    
//    public static func buildArray(_ components: [any StyleAdjacent]) -> Style {
//        return Style(components)
//    }
//    
//    public static func buildBlock(_ components: (any StyleAdjacent)...) -> Style  {
//        return Style(components)
//    }
//    
//    public static func buildOptional(_ component: Style?) -> Style {
////        guard let component = component else {
////            return []
////        }
//        
//        return component ?? Style.none()
//    }
//    
//    public static func buildEither(first component: Style) -> Style {
////        if let component = component as? List {
////            // TODO: add then shift?
////            return List(component.children, hash: (component.hash << 1) + 1)
////        }
//        
//        return component
//    }
//
//    public static func buildEither(second component: Style) -> Style {
////        if let component = component as? List {
////            return List(component.children, hash: (component.hash << 1))
////        }
//
//        return component
//    }
//          
//}
