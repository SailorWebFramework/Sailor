//
//  File.swift
//  
//
//  Created by Joshua Davis on 2/13/24.
//


import Sailboat

public enum NoRoutes: Routes {
    public static var Root: Self { .root }
    public static var NotFound: Self { .notFound }
    
    public static var bindings: BidirectionalDictionary<NoRoutes, String> = [
        .root: "/",
        .notFound: "404"
    
    ]

    case root, notFound
    
}
