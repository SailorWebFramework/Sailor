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
        // if page is an HTMLElement
        if let page = page as? any HTMLElement {
            
            let domNode = DOMNode(
                page: page,
                element: App.document.createElement(page.name),
                parent: parentNode
            )
            
            parentNode.append(domNode)
            
            // add children
            for (_, child) in page.children.enumerated() {
                BuildFactory.build(page: child, parentNode: domNode)

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