//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/16/23.
//

import Foundation


extension DOMNode {
    
    // TODO: remove from state in replace
    // TODO: make page a constant and delete this node from linked list
    /// replace current domnode page with new page
    func replace(_ page: any Page) {
        
//        if !domNode.compareAttributes(to: page) {
//            domNode.update(attributes: page.attributes)
//        }
//
//        if !domNode.compareContent(to: page) {
//            domNode.update(content: page.content)
//        }
        
//
//        // TODO: fix this? do i need this?
//        if !domNode.compareEvents(to: page) {
//            domNode.update(events: page.events)
//        }
        
        
        self.reset(to: page)
        
        if let page = self.page as? any HTMLElement {
            update(attributes: page.attributes)
            update(events: page.events)
            update(content: page.content)
            update(children: page.children)

        }
        
        
        self.renderToDOM()

    }
}
