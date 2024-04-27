//
//  File.swift
//  
//
//  Created by Joshua Davis on 3/18/24.
//

public struct Never: Page {
    
    public var body: Never {
        .error()
    }
    
    public static func error() -> Never {
        fatalError("This body should never be called")
    }
}
