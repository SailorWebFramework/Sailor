//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/26/23.
//

import Foundation
import JavaScriptKit

extension PageNode {
    
    // TODO: remove child call? use parent self.parent
    /// build to current all elements under self and add to DOM
    func build(child: any Page) {
        
        let aboveElement: JSObject
                
        if let parentElement = (self as? HTMLNode)?.element {
            aboveElement = parentElement
        } else if let upperElement = self.aboveElement {
            aboveElement = upperElement
        } else {
            // TODO: throw error
            fatalError("aboveElement is nil, No Renderable location to render Element")
            return
        }
        
        // if page is an Operator
        if let page = child as? any Operator {

            // create new virtual dom node
            let domNode = OperatorNode(
                page: page,
                aboveElement: aboveElement,
                parent: self
            )

            // add new node as a child of the current parent
            self.append(domNode)

            // add children
            for child in page.children {
                domNode.build(child: child)
            }
            
            return
        }
        
        // if page is an HTMLElement
        if let page = child as? any HTMLElement {
            
            // create new virtual dom node
            let domNode = HTMLNode(
                page: page,
                aboveElement: aboveElement,
                parent: self
            )
            
            // add new node as a child of the current parent
            self.append(domNode)
            
            // run the page builder closure to create an operator node
            if case let .list(listpage) = page.content {
                domNode.build(child: listpage())
            }
            
            // render to DOM
            domNode.renderToDOM()

            return

        }
        
        // if page is a custom page
        let domNode = CustomNode(
            page: child,
            aboveElement: aboveElement,
            parent: self
        )
        
        self.append(domNode)

        domNode.build(child: child.body)

    }
}
