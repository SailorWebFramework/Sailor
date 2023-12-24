//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/22/23.
//

//import Foundation
//import JavaScriptKit
//
//public class DOMNode {
//
//    /// child dom nodes contained by this HTMLElement, only one child (ie: body) for a Page
//    public var children: [DOMNode]
//    
//    /// weak reference to parent node in dom tree
//    weak public var parent: DOMNode?
//        
//    /// the javascript pointer to element in the DOM
//    public var element: JSObject?
//    
//    /// the page element for this node
//    public var page: any Page
//
//    init(
//        page: any Page,
//        element: JSObject? = nil,
//        parent: DOMNode? = nil
//    ) {
//        self.page = page
//        self.parent = parent
//        self.element = element
//        self.children = []
//
//    }
//    
//    public func compareTag(to page: any Page) -> Bool {
//        return type(of: self.page) == type(of: page)
//    }
//    
//    public func renderToDOM() {
//        _ = self.parent?.element?.appendChild(self.element)
//    }
//
//    public func append(_ domNode: DOMNode) {
//        self.children.append(domNode)
//        domNode.parent = self
//    }
//    
//    // TODO: make better with linked list
//    public func removeFromParent() {
//        // remove from parent
//        self.parent?.children.removeAll { $0 === self }
//        
//    }
//    
//    public func reset(to page: any Page) {
//        self.remove()
//        
//        self.page = page
//
//        if let page = page as? any HTMLElement {
//            self.element = App.document.createElement(page.name)
//        } else {
//            self.element = parent?.element
//        }
//        
//    }
//    
//    public func remove() {
//        // remove html elements from DOM
//        self.removeDeepFromDOM()
//        
//        // free children in memory
//        self.children = []
//        
//        // remove element reference
//        self.element = nil
//
//    }
//    
//    public func delete() {
//        self.remove()
//        self.removeFromParent()
//    }
//
//    internal func removeDeepFromDOM() {
//        // remove current element & reference
//        if self.page is any HTMLElement {
//            _ = self.element?.remove()
//        }
//        
//        self.element = nil
//        
//        for child in self.children {
//            child.removeDeepFromDOM()
//        }
//        
//    }
// 
//}
