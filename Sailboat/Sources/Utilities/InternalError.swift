//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/19/23.
//

public enum InternalError {
    public static func recursingInPageBody(name: String) {
        fatalError("infinitly recursing in body of \(name)")
    }
    
    public static func listBeingRendered() {
        fatalError("list item is being rendered")
    }
    
    public static func builtPageShouldHaveBody() {
        fatalError("diffing error, built page should have a body")

    }
}
