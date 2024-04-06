//
//  StyleBuilder.swift
//  
//
//  Created by Joshua Davis on 3/29/24.
//

import Sailboat

@resultBuilder
public struct StyleBuilder {
    
    public static func buildArray(_ components: [Style.Property]) -> [Style.Property] {
        return components
    }
    
    public static func buildBlock(_ components: Style.Property...) -> [Style.Property]  {
        return components
    }
          
}
