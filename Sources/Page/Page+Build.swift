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

    public func build(parent: JSValue, virtualDOM: DOMNode) {
        // TODO: virtualDOM.append(DOMNode())
        var domNode = DOMNode(
            page: self, 
            element: parent, // nil
            attributes: self.attributes, // [:]
            parent: virtualDOM
        )

        virtualDOM.append(domNode)

        body.build(parent: parent, virtualDOM: domNode)
    }
    
    public func attribute(_ type: Attribute, value: some AttributeValue) -> Self {
        var copy = self
        copy.attributes[type] = value
        return copy
    }
}

extension Page {
    public func outerEquals(to page: any Page) -> Bool {
        if type(of: self) == type(of: page) {
            return page.attributes == self.attributes
        }

        return false
    }
}