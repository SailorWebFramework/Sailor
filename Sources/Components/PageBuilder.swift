//
//  File.swift
//  
//
//  Created by Joshua Davis on 10/3/23.
//

import Foundation

@resultBuilder
public struct PageBuilder {
    public static func buildBlock(_ children: any Page...) -> [any Page] {
        return children
    }
    
    // TODO: Make non-static logic components
//    static func buildOptional(_ component: any Page...) -> any Page {
////        if component.count == 0 {
////            return []//Div()
////        }
//
//        return component //Div(children: component)
//    }
//
//    static func buildEither(first: any Page...) -> [any Page] {
//        return first //Div(children: first)
//    }
//
//    static func buildEither(second: any Page...) -> [any Page] {
//        return second //Div(children: second)
//    }
    
}
