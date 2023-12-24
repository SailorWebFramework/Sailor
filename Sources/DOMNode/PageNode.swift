//
//  File.swift
//
//
//  Created by Joshua Davis on 12/22/23.
//

import Foundation
import JavaScriptKit

import Foundation
import JavaScriptKit

public class DOMNode: CustomStringConvertible {

    /// child dom nodes contained by this HTMLElement, only one child (ie: body) for a Page
    public var children: [DOMNode]
    
    /// weak reference to parent node in dom tree
    weak public var parent: DOMNode?
    
    ///
    weak public var aboveElement: JSObject?

    /// the page element for this node
    public var page: any Page
    
    public var description: String {
        "PageNode(type: \(type(of:self.page)), children: \(self.children.count))"
    }

    init(
        page: any Page,
        aboveElement: JSObject,
        parent: DOMNode? = nil
    ) {
        self.page = page
        self.parent = parent
        self.aboveElement = aboveElement
        self.children = []

    }
    
    public func compareTag(to page: any Page) -> Bool {
        return type(of: self.page) == type(of: page)
    }

    public func append(_ domNode: PageNode) {
        self.children.append(domNode)
        domNode.parent = self
    }
    
    // TODO: make better with linked list
    public func removeFromParent() {
        // remove from parent
        self.parent?.children.removeAll { $0 === self }
        
    }
    
    internal func remove() {
        // free children in memory
        self.children = []
        
    }
    
    public func removeFromDOM() {
        
        // remove current element & reference
        for child in self.children {
            child.removeFromDOM()
        }
        
        remove()
        
    }
 
}

