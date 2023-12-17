//
//  File.swift
//  
//
//  Created by Joshua Davis on 10/3/23.
//

import Foundation

//protocol Pageable { }

// TODO: divs can only take in a List now
// TODO: if array is entered locked into array, if single locked in to single
// TODO: Make non-static logic components
@resultBuilder
public struct PageBuilder {
    public static func buildBlock(_ children: any Page...) -> List {
        return List(children)
    }
    
    public static func buildOptional(_ component: List?) -> List {
        if let component = component { return component }
        return List()
    }
    
    // TODO: make it so if there is one element in the List than it doesnt implicitly wrap in a div
    public static func buildEither(first component: List) -> List {
//        if component.children.count == 1,
//           let first = component.children.first
//        {
//            return first
//        }
        return component
    }

    public static func buildEither(second component: List) -> List {
//        if component.children.count == 1,
//           let first = component.children.first
//        {
//            return first
//        }
        return component
    }
    
}
