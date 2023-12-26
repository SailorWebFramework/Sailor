//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/19/23.
//

import Foundation
import JavaScriptKit

/// builder of pages
enum BuildFactory {
    
    // TODO: ??
    static func rebuild() {
        
    }
    
    static func build(page: any Page, parentNode: PageNode) {
        let aboveElement: JSObject
        
//        print("building page: \(page.description)")
        
        if let parentElement = (parentNode as? HTMLNode)?.element {
            aboveElement = parentElement
        } else if let upperElement = parentNode.aboveElement {
            aboveElement = upperElement
        } else {
            // TODO: throw error
            return
        }
        
        // if page is an Operator
        if let page = page as? any Operator {

            // create new virtual dom node
            let domNode = OperatorNode(
                page: page,
                aboveElement: aboveElement
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
            let domNode = HTMLNode(
                page: page,
                aboveElement: aboveElement
            )
            
            // add new node as a child of the current parent
            parentNode.append(domNode)
            
            // run the page builder closure to create an operator node
            if case let .list(listpage) = page.content {
                BuildFactory.build(page: listpage(), parentNode: domNode)
            }
            
            // render to DOM
            domNode.renderToDOM()

            return

        }
        
        // if page is a custom page
        let domNode = PageNode(
            page: page,
            aboveElement: aboveElement
        )
        
        parentNode.append(domNode)

        BuildFactory.build(page: page.body, parentNode: domNode)

    }
    // TODO: consider putting the Update & Build functions that were in App class here
}
