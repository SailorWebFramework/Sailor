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

    public func build(parentNode: DOMNode) {
        self.build(parentNode: parentNode, domNode: nil)
    }

    public func build(parentNode: DOMNode, domNode: DOMNode?) {
        if let domNode = domNode {
            domNode.page = self
            domNode.element = parentNode.element
            domNode.attributes = self.attributes
            domNode.parent = parentNode
            body.build(parentNode: domNode)
            return
        }
        let newdNode = DOMNode(
            page: self, 
            element: parentNode.element, // nil
            attributes: self.attributes, // [:]
            parent: parentNode
        )

        parentNode.append(newdNode)
        body.build(parentNode: newdNode)

    }
    
    public func attribute(_ type: Attribute, value: some AttributeValue) -> Self {
        var copy = self
        copy.attributes[type] = value
        return copy
    }
}

extension Page {

    public func equals(to page: any Page) -> Bool {
        if page is any HTMLElement {
            print("IAM HTML ELEMENT")
            return false
        }
        if !outerEquals(to: page) {
            return false
        }

        if !self.body.equals(to: page.body) {
            return false
        }

        return true
    }

    public func outerEquals(to page: any Page) -> Bool {
        if type(of: self) == type(of: page) {
            return page.attributes == self.attributes
        }

        return false
    }
}