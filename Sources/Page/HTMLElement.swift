//
//  HTMLElement.swift
//  
//
//  Created by Joshua Davis on 10/3/23.
//

import Foundation
import JavaScriptKit

protocol HTMLElement: Page {
    // TODO: either keep (prob just keep element), domNode, tagName, or children
    var element: JSValue { get set }
    // var domNode: DOMNode { get set }
    var tagName: String { get } 
    var children: [any Page] { get set }
    var content: String { get set }

}

extension HTMLElement {
    // TODO: make description work instead of render?
    public var description: String { "TODO" }

    // TODO: just pass in parentNode and no parent
    public func build(parentNode: DOMNode, domNode: DOMNode? = nil) {
        let newdNode = domNode == nil ? DOMNode(
            page: self, 
            element: self.element, //App.document.createElement(self.tagName), 
            parent: parentNode
        ) : domNode! // force unwrappping but should be fine?

        // let newdNode = DOMNode(
        //     page: self, 
        //     element: self.element, //App.document.createElement(self.tagName), 
        //     parent: parentNode
        // ) 
        // add content
        newdNode.content = self.content

        if !self.content.isEmpty {
            newdNode.element?.textContent = JSValue.string(self.content)
        }

        // add attributes
        newdNode.attributes = self.attributes

        for (key, value) in self.attributes {
            _ = newdNode.element?.setAttribute(key.description, value.description)
        }

        // add children
        for (_, child) in children.enumerated() {
            child.build(parentNode: newdNode)
        }

        // add to DOM
        _ = parentNode.element?.appendChild(self.element)

        if domNode == nil {
            parentNode.append(newdNode)
        }
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
