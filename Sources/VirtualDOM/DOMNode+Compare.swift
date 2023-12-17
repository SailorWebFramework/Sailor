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

    // TODO: these meathods feel weird / pointless
    func compareAttributes(to page: any Page) -> Bool {
        return self.attributes == (page as? any HTMLElement)?.attributes ?? [:]
    }
    
    func compareEvents(to page: any Page) -> Bool {
        return self.events == (page as? any HTMLElement)?.events ?? [:]
    }
    
    /// compares the outer html to page, compares the tag, attributes, and events
    func compareOuter(to page: any Page) -> Bool {
        return compareTag(to: page) && compareAttributes(to: page) && compareEvents(to: page)
    }
    
    func compareContent(to page: any Page) -> Bool {
        return self.content == (page as? any HTMLElement)?.content ?? ""
    }
    
    func compareChildrenSize(to page: any Page) -> Bool {
        // TODO: better compare

        return self.children.count == (page as? any HTMLElement)?.children.count ?? 0
    }
    
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
