//
//  File.swift
//  
//
//  Created by Joshua Davis on 10/6/23.
//

import Foundation

final class App {
    static var cssStyles: [Style] = []
    
    static var pageHierarchy: PageHierarchy? = nil
    
    static var builtDOM: any Page = Div()
    static var virtualDOM: any Page {
        pageHierarchy?.root ?? builtDOM
    }
    
    static func set(_ pageHierarchy: PageHierarchy) {
        Self.pageHierarchy = pageHierarchy
    }

    static func update() -> Bool {
        // check if dom must be updated
        if builtDOM == virtualDOM { return false }
        
        // update dom here
        // ... how tf
        
        return true
    }
    
    
    static func build(loc: URL) {
        // build pages
        pageHierarchy?.build(loc: loc)
        
        // build css files
    }

}
