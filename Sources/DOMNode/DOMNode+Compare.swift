//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/16/23.
//

import Foundation


extension DOMNode {
    
    func compareTag(to page: any Page) -> Bool {
        return type(of: self.page) == type(of: page)
    }

    func compareAttributes(to page: any HTMLElement) -> Bool {
        return self.attributes == page.attributes
    }
    
    // TODO: get compare events working properly??
    func compareEvents(to page: any Page) -> Bool {
        return false
//        return self.events == (page as? any HTMLElement)?.events ?? [:]
    }
    
    /// compares the outer html to page, compares the tag, attributes, and events
    // func compareOuter(to page: any Page) -> Bool {
    //     return compareTag(to: page) && compareAttributes(to: page) && compareEvents(to: page)
    // }
    
     func compareTextContent(to page: any HTMLElement) -> Bool {
         guard case let .text(newText) = page.content else { return false }
         guard case let .text(curText) = self.content else { return false }

         return newText == curText
     }
    
    // func compareChildrenSize(to page: any Page) -> Bool {
    //     // TODO: better compare

    //     return self.children.count == (page as? any HTMLElement)?.children.count ?? 0
    // }
    
//    func compareChildren(to page: any Page) -> Bool {
//        // TODO: better compare
//
//
//        return self.children == (page as? any HTMLElement)?.children ?? []
//    }
    
//    func compareInner(to page: any Page) -> Bool {
//        return compareChildren(to: page) && compareContent(to: page)
//    }
    
}
