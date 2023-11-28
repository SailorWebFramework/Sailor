//
//  HTMLElement.swift
//  
//
//  Created by Joshua Davis on 10/3/23.
//

import Foundation
import JavaScriptKit

protocol HTMLElement: Page {
    var element: JSValue { get set }
    // var domNode: DOMNode { get set }
    var tagName: String { get }
    var children: [any Page] { get set }
    var content: String { get set }

    // func updateInner(domNode: DOMNode)
    // func updateAttributes(domNode: DOMNode)
    // func remove(domNode: DOMNode)
}

extension HTMLElement {
    // TODO: make description work instead of render?
    public var description: String { "TODO" }

    // TODO: just pass in parentNode and no parent
    public func build(parent: JSValue, virtualDOM: DOMNode) {
        var curElement = self.element

        let domNode = DOMNode(page: self, element: self.element, parent: virtualDOM)

        // add content
        domNode.content = self.content

        if !self.content.isEmpty {
            curElement.textContent = JSValue.string(self.content)
        }

        // add attributes
        domNode.attributes = self.attributes

        for (key, value) in self.attributes {
            _ = curElement.setAttribute(key.description, value.description)
        }

        // add children
        for (_, child) in children.enumerated() {
            child.build(parent: curElement, virtualDOM: domNode)
        }

        // add to DOM
        _ = parent.appendChild(curElement)
        virtualDOM.append(domNode)
    }
    
}

//MARK - Hashable
extension HTMLElement {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(content)
        
        for child in children {
            hasher.combine(child)
        }
    }
}

extension HTMLElement {

    // TODO: maybe this shouldnt test content because thats techinically inner?
    public func outerEquals(to page: any Page) -> Bool {
        if type(of: self) == type(of: page) {
            if let page = page as? any HTMLElement {
                
                return (
                    page.attributes == self.attributes &&
                    page.content == self.content
                )

               }
        }

        return false
    }
}
