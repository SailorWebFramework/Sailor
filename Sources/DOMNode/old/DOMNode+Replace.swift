////
////  File.swift
////  
////
////  Created by Joshua Davis on 12/16/23.
////
//
//import Foundation
//
//
//extension DOMNode {
//    
//    
//    func diffAndReplaceOuter(_ page: any HTMLElement) {
//        
//        if !self.compareAttributes(to: page) {
//            self.update(attributes: page.attributes)
//        }
//        
//        if !self.compareTextContent(to: page),
//           case let .text(textContent) = page.content {
//            self.update(textContent: textContent)
//        }
//
//        // TODO: fix this? do i need this?
//        if !self.compareEvents(to: page) {
//            self.update(events: page.events)
//        }
//        
//    }
//    
//    // TODO: remove from state in replace
//    // TODO: make page a constant and delete this node from linked list
//    /// replace current domnode page with new page
//    func replace(_ page: any Page) {
//        
//        self.reset(to: page)
//        
//        if let page = self.page as? any HTMLElement {
//            update(attributes: page.attributes)
//            update(events: page.events)
//            update(content: page.content)
//
//        }
//        
//        
//        self.renderToDOM()
//
//    }
//}
