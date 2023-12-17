//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/16/23.
//

import Foundation

//MARK - Hashable
extension HTMLElement {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(content)
        
        for child in children {
            hasher.combine(child)
        }
    }
}

extension HTMLElement {

    
//    public func equals(to page: any Page) -> Bool {
//        if !outerEquals(to: page) {
//            return false
//        }
//
//        guard let otherpage = page as? any HTMLElement else {
//            return false
//        }
//
//        if otherpage.children.count != self.children.count {
//            return false
//        }
//
//        for (i, child) in children.enumerated() {
//            if !child.equals(to: otherpage.children[i]) {
//                return false
//            }
//        }
//
//        return true
//    }

    // TODO: maybe this shouldnt test content because thats techinically inner?
//    public func outerEquals(to page: any Page) -> Bool {
//        if type(of: self) == type(of: page) {
//            if let page = page as? any HTMLElement {
//                
//                return (
//                    page.attributes == self.attributes &&
//                    page.content == self.content
//                )
//
//               }
//        }
//
//        return false
//    }
}
