//
//  DefaultManager+Build.swift
//  
//
//  Created by Joshua Davis on 2/2/24.
//

internal extension DefaultManager {
    
    static func build(page: any Page, parent: (any PageNode)?) -> any PageNode {
        // if page is an Operator
        if let page = page as? any Operator {

            // create new virtual dom node
            let domNode = OperatorNode(
                page: page,
                parent: parent
            )

            // add new node as a child of the current parent
            parent?.append(domNode)

            // add children
            for child in page.children {
                _ = Self.build(page: child, parent: domNode)
            }
            
            return domNode
        }
        
        // if page is an HTMLElement
        if let page = page as? any Element {
            
            // create new virtual dom node
            let domNode = ElementNode(
                page: page,
                parent: parent
            )
            
            // add new node as a child of the current parent
            parent?.append(domNode)
            
            // run the page builder closure to create an operator node
            if case let .list(listpage) = page.content {
                _ = Self.build(page: listpage(), parent: domNode)
            }
            
            return domNode

        }
        
        // if page is a custom page
        let domNode = CustomNode(
            page: page,
            parent: parent
        )
        
        parent?.append(domNode)
        _ = Self.build(page: page.body, parent: domNode)
        
        return domNode

    }
}
