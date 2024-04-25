//
//  File.swift
//  
//
//  Created by Joshua Davis on 4/24/24.
//

import Sailboat

//protocol CustomPage: Page {
//    associatedtype Body: CustomPage
//    
//    var body: Body { get }
//}


//struct CustomPageBuilder<CustomPageType: Page>: Page {
//    
//    var body: CustomPageType
//}

//protocol SYPage: Page { }

//typealias SYPage = CustomPageBuilder<CustomPage>

//@resultBuilder
//public struct CustomPageBuilder<each CustomPage> where each CustomPage == Page {
//
//    // TODO: is this the expected functionality
//    public static func buildArray(_ components: repeat each CustomPage) -> any Fragment {
//        let keys = hashKeysHelper(components)
//        if keys == "" {
//            return List(components, hash: String(components.count))
//        }
//        return List(components, hash: keys)
//    }
//    
//    public static func buildBlock(_ components: repeat each CustomPage) -> any Fragment  {
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
//    private static func hashKeysHelper(_ components: repeat each CustomPage) -> String {
//        var output = ""
//        for (c) in repeat (each components) {
//          guard left == right else { return false }
//        }
//
//        return output
//    }
//    
//}
//
