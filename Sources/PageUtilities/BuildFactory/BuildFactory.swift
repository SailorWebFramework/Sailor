//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/19/23.
//

import Foundation


/// builder of pages
enum BuildFactory {
    
    // TODO: use this as new build function
    static func build(page: any Page, parentNode: DOMNode) {
        // TODO: dont render list change pagebuilder conditional to wrap in a div?
        // if page is an Operator
        if let page = page as? any Operator {

            // create new virtual dom node
            let domNode = DOMNode(
                page: page,
                element: parentNode.element,
                parent: parentNode
            )

            // add new node as a child of the current parent
            parentNode.append(domNode)

            // add children
            for child in page.children {
                BuildFactory.build(page: child, parentNode: domNode)

            }
            
            return
        }
        
        // if page is an HTMLElement
        if let page = page as? any HTMLElement {
            
            // create new virtual dom node
            let domNode = DOMNode(
                page: page,
                element: App.document.createElement(page.name),
                parent: parentNode
            )
            
            // add new node as a child of the current parent
            parentNode.append(domNode)
            
            // add children
            if case let .list(listpage) = page.content {
                let children = listpage().children
                for (_, child) in children.enumerated() {
                    BuildFactory.build(page: child, parentNode: domNode)

                }
            }
            
            // render to DOM
            domNode.renderToDOM()

            return

        }
        
        // if page is a custom page
        let domNode = DOMNode(
            page: page,
            // TODO: this is maybe fine but element for a page element is its parent
            element: parentNode.element,
            parent: parentNode
        )
        
        parentNode.append(domNode)

        BuildFactory.build(page: page.body, parentNode: domNode)

    }
    // TODO: consider putting the Update & Build functions that were in App class here
}
