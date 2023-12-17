//
//  File.swift
//  
//
//  Created by Joshua Davis on 11/24/23.
//

import Foundation
import JavaScriptKit

extension Page {
    public var description: String {
        "Page(type: \(type(of: self)))"
    }

    public func build(parentNode: DOMNode) {
        let domNode = DOMNode(
            page: self,
            // TODO: this is maybe fine but element for a page element is its parent
            element: parentNode.element,
            parent: parentNode
        )

        parentNode.append(domNode)
        
        body.build(parentNode: domNode)

    }

}

extension Page {

//    public func equals(to page: any Page) -> Bool {
//        if page is any HTMLElement {
//            print("IAM HTML ELEMENT")
//            return false
//        }
//        if !outerEquals(to: page) {
//            return false
//        }
//
//        if !self.body.equals(to: page.body) {
//            return false
//        }
//
//        return true
//    }

//    public func outerEquals(to page: any Page) -> Bool {
//        if type(of: self) == type(of: page),
//           let selfpage = self as? (any HTMLElement),
//           let page = self as? (any HTMLElement)
//        {
//            return page.attributes == selfpage.attributes
//        }
//
//        return false
//    }
}
