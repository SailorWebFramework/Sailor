//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/16/23.
//

import Foundation


extension DOMNode {
    
    // TODO: remove from state in replace
    /// replace current domnode page with new page
    func replace(_ page: any Page) {
        
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
