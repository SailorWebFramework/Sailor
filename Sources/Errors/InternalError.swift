//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/19/23.
//

import Foundation

enum InternalError {
    static func recursingInPageBody(name: String) {
        fatalError("infinitly recursing in body of \(name)")
    }
    
    static func listBeingRendered() {
        fatalError("list item is being rendered")
    }
    
    static func builtPageShouldHaveBody() {
        fatalError("diffing error, built page should have a body")

    }
}
