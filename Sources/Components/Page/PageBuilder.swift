//
//  File.swift
//  
//
//  Created by Joshua Davis on 10/3/23.
//

import Foundation

protocol Pageable { }


// TODO: divs can only take in a List now
// TODO: if array is entered locked into array, if single locked in to single
// TODO: Make non-static logic components
@resultBuilder
public struct PageBuilder {
    public static func buildBlock(_ children: any Page...) -> List {
        return List(children)
    }
    
//    static func buildOptional(_ component: (any Page)?) -> any Page {
//        if let component = component { return component }
//        return Nothing()
//    }
//
//    static func buildEither(first component: any Page) -> any Page {
//        return component
//    }
//
//    static func buildEither(second component: any Page) -> any Page {
//        return component
//    }
    
    // TODO: should this be removed , currently use List instead
//    public static func buildBlock(_ children: [any Page]...) -> any Page {
//        return List(children.flatMap { $0 })
//    }
//    

    static func buildOptional(_ component: List?) -> List {
        if let component = component { return component }
        return List()
    }

    static func buildEither(first component: List) -> List {
        return component
    }

    static func buildEither(second component: List) -> List {
        return component
    }
    
}
