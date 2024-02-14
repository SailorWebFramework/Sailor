//
//  File.swift
//  
//
//  Created by Joshua Davis on 2/13/24.
//


import Sailboat

enum NoRoutes: Routes {
    static var getRoot: Self { .root }

    case root
    
    public var description: String {
        switch self {
        case .root:
            return "/"
        }
    }
    
}
