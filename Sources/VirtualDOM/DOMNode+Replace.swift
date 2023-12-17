//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/16/23.
//

import Foundation


extension DOMNode {
    
    /// replace current domnode page with new page
    func replace(_ page: any Page) {
        
//        self.remove()
        self.reset(to: page)
//        self.page = page
        
        if let page = self.page as? any HTMLElement {
            update(attributes: page.attributes)
            update(events: page.events)
            update(content: page.content)
            update(children: page.children)

        }

    }
}
