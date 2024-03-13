//
//  File.swift
//  
//
//  Created by Joshua Davis on 3/13/24.
//

import Sailboat

public protocol SailorEnvironment: SomeEnvironment {
    var url: String { get }
    
    init()
}

public struct EmptyEnvironment: SailorEnvironment {
    public var url: String { "/" }
    
    public init() { }
}
