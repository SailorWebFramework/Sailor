//
//  DynamicClassContainer.swift
//
//
//  Created by Joshua Davis on 4/13/24.
//

import Sailboat
import SailorShared

public protocol DynamicClassContainer: DynamicClass { 
    var names: [any DynamicClass] { get set }

}

extension DynamicClassContainer {
    var description: String {
        classes.description
    }
    
    @_spi(Private)
    public var classes: some DynamicClass {
        fatalError("DynamicClassContainer does not have body")
        return ""
    }
}

public struct ClassGroup: DynamicClassContainer {
    public var description: String {
        names.reduce("") {
            if $0 == "" {
                return $1.description
            }
            
            return "\($0) \($1.description)"
        }
    }
        
    @_spi(Private) public var names: [any DynamicClass]
    
    internal init(_ classes: [any DynamicClass]) {
        self.names = classes
    }
    
    public init(@ClassBuilder _ classContainer: () -> any DynamicClassContainer) {
        self.names = classContainer().names
    }

}

extension String: DynamicClass {
    @_spi(Private)
    public var classes: some DynamicClass {
        fatalError("String Dynamic class does not have body")
        return ""
    }
}
