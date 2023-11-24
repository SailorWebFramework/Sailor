//
//  File.swift
//  
//
//  Created by Joshua Davis on 11/24/23.
//

import Foundation
import JavaScriptKit

extension Page {
    public var description: String { body.description }
    
    public func build(parent: JSValue) {
        body.build(parent: parent)
    }
    
    public func attribute(_ type: Attribute, value: some AttributeValue) -> Self {
        var copy = self
        copy.attributes[type] = value
        return copy
    }
}
