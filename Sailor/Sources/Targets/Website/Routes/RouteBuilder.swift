//
//  RouteBuilder.swift
//  
//
//  Created by Joshua Davis on 2/12/24.
//

import Sailboat

@resultBuilder
public struct RouteBuilder<MyRoutes: Routes> {
    public static func buildBlock(_ children: Route<MyRoutes>...) -> any Operator {
        return List(children)
    }
    
}
