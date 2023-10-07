//
//  File.swift
//  
//
//  Created by Joshua Davis on 10/3/23.
//

import Foundation

// TODO: Make non-static logic components
@resultBuilder
public struct PageBuilder {
    public static func buildBlock(_ children: any Page...) -> [any Page] {
        return children
    }
    
    public static func buildBlock(_ children: [any Page]...) -> [any Page] {
        return children.flatMap { $0 }
    }
    
    static func buildOptional(_ component: [any Page]?) -> [any Page] {
        if let component = component { return component }
        return []
    }

    static func buildEither(first component: [any Page]) -> [any Page] {
        return component
    }

    static func buildEither(second component: [any Page]) -> [any Page] {
        return component
    }
    
}
