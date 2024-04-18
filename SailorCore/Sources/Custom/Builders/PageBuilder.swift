//
//  PageBuilder.swift
//  
//
//  Created by Joshua Davis on 10/3/23.
//

import Sailboat

@resultBuilder
public struct PageBuilder {

    // TODO: is this the expected functionality
    public static func buildArray(_ components: [any Page]) -> any Fragment {
        let keys = hashKeysHelper(components)
        if keys == "" {
            return List(components, hash: String(components.count))
        }
        return List(components, hash: keys)
    }
    
    public static func buildBlock(_ components: any Page...) -> any Fragment  {
        return List(components, hash: "")
    }
            
    public static func buildOptional(_ component: (any Fragment)?) -> any Fragment {
        guard let component = component else {
            return List([], hash: "-")
        }
        
        return component
    }
    
    public static func buildEither(first component: any Fragment) -> any Fragment {
        if let component = component as? List {
            // TODO: add then shift?
            return List(component.children, hash: component.hash + "1")
        }
        
        return component
    }

    public static func buildEither(second component: any Fragment) -> any Fragment {
        if let component = component as? List {
            return List(component.children, hash: component.hash + "0")
        }

        return component
    }
    
    private static func hashKeysHelper(_ components: [any Page]) -> String {
        var output = ""
        
        // TODO: verify what happens when key has a @State variable
        for page in components {
            if let list = page as? any Fragment {
                output += hashKeysHelper(list.children)
            } else if let element = page as? any Element {
                output += element.attributes["_key"]?().description ?? ""
            } else {
                output += hashKeysHelper([page.body])
            }
        }
        
        return output
    }
    
}
