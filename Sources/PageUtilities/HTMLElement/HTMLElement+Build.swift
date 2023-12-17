//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/16/23.
//

import Foundation

extension HTMLElement {
    public var description: String {
        "HTMLElement(type: \(type(of: self)), attributes: \(self.attributes), events: \(self.events), content: \(self.content), children: \(self.children.count))"
    }
    
    public func build(parentNode: DOMNode) {
        let domNode = DOMNode(
            page: self,
            element: App.document.createElement(self.name),
            content: self.content,
            attributes: self.attributes,
            events: self.events,
            parent: parentNode
        )
        
        parentNode.append(domNode)

        // add children
        for (_, child) in children.enumerated() {
            child.build(parentNode: domNode)
        }

        domNode.renderToDOM()

    }
    
}
