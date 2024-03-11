//
//  RouteBuilder.swift
//  
//
//  Created by Joshua Davis on 2/12/24.
//

import Sailboat

@resultBuilder
public struct RouteBuilder<MyRoutes: Routes> {
    public static func buildBlock(_ children: Route<MyRoutes>...) -> [Route<MyRoutes>] {
        // TODO: is this what is good? should i keep the route operator?
//        do {
//            return List(
//                try children.reduce<Array<any Page>>([]) {
//                    $0 + $1.children
//                }
//            )
//        } catch {
//            return List([])
//        }
//        return List(children)
        return children

    }
    
}
