////
////  BodyBuilder.swift
////
////
////  Created by Joshua Davis on 10/3/23.
////
//
//import Sailboat
//
//// TODO: make body builder work instead of PageBuilder
//@resultBuilder
//public struct BodyBuilder {
//    
//    // TODO: should this allowed , should it be stateful?
//    public static func buildArray(_ components: [any BodyPage]) -> any Fragment {
//        let keys = components.filter("") { $0 + $1 }
//        return List(components, hash: String(components.count))
//    }
//    
//    public static func buildBlock(_ components: any BodyPage...) -> any Fragment  {
//        return List(components, hash: "")
//    }
//            
//    public static func buildOptional(_ component: (any Fragment)?) -> any Fragment {
//        guard let component = component else {
//            return List([], hash: "-")
//        }
//        
//        return component
//    }
//    
//    public static func buildEither(first component: any Fragment) -> any Fragment {
//        if let component = component as? List {
//            // TODO: add then shift?
//            return List(component.children, hash: component.hash + "1")
//        }
//        
//        return component
//    }
//
//    public static func buildEither(second component: any Fragment) -> any Fragment {
//        if let component = component as? List {
//            return List(component.children, hash: component.hash + "0")
//        }
//
//        return component
//    }
//    
//}
