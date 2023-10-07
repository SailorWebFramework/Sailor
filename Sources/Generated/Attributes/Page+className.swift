//
//  File.swift
//  
//
//  Created by Joshua Davis on 10/6/23.
//

import Foundation



extension Page {
    // TODO: these can be auto generated
    public func className(_ value: String) -> Self {
        var copy = self
        
        copy.attributes[.className] = value
        
        return copy
    }

    public func src(_ value: String) -> Self {
        var copy = self
        
        copy.attributes[.src] = value
        
        return copy
    }
}
