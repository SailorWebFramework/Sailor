//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/26/23.
//

import Foundation
import JavaScriptKit


extension PageNode {
    
//    public func rebuild(renderSelf: Bool = true) {
//
//        // TODO: any build things here
//
//        for child in self.children {
//            child.rebuild(renderSelf: true)
//        }
//
//        renderToDOM(renderSelf: renderSelf)
//    }
//
    
    public func compareTag(to page: any Page) -> Bool {
        return type(of: self.page) == type(of: page)
    }

    public func append(_ domNode: any PageNode) {
        self.children.append(domNode)
        domNode.parent = self
        
        if let htmlNode = self as? HTMLNode {
            domNode.aboveElement = htmlNode.element
            
        } else {
            domNode.aboveElement = self.aboveElement
            
        }
        
    }
    
    // TODO: make better with linked list
    public func removeFromParent() {
        self.parent?.children.removeAll { $0 === self }
    }
    
    func replace(using page: any Page) {
        guard let aboveElement = aboveElement else { return }
        guard let index = parent?.children.firstIndex(where: { $0 === self }) else { return }

        self.removeFromDOM(unrenderSelf: false)
        
        let pageNode: any PageNode
        
        if let page = page as? any HTMLElement {
            pageNode = HTMLNode(
                page: page,
                aboveElement: aboveElement,
                element: (self as? HTMLNode)?.element,
                parent: self
            )
            
            if case let .list(makelist) = page.content {
                pageNode.build(child: makelist())
            }
            
        } else if let page = page as? any Operator {
            pageNode = OperatorNode(
                page: page,
                aboveElement: aboveElement,
                parent: self
            )
            for child in page.children {
                pageNode.build(child: child)
            }
        } else {
            pageNode = CustomNode(
                page: page,
                aboveElement: aboveElement,
                parent: self
            )
            pageNode.build(child: page.body)
        }
        
        parent?.children.insert(pageNode, at: index)

    }
    
    /// insert given a pageNode with an already rendered DOM element reference at a given index
//    private func insert(_ pageNode: any PageNode, at index: Int) {
//        parent?.children.insert(pageNode, at: index)
////        pageNode.rebuild(renderSelf: false)
//        pageNode.build(child: <#T##Page#>)
//    }

    public func renderToDOM() {
        renderToDOM(renderSelf: true)
    }
    
    private func renderToDOM(renderSelf: Bool) {
        add()
        
        guard let htmlNode = self as? HTMLNode, renderSelf else { return }
        
        // render HTML element to DOM
        _ = aboveElement?.appendChild?(htmlNode.element)
    }
    
    public func removeFromDOM(unrenderSelf: Bool = false) {
        
        // remove current element & reference
        for child in self.children {
            child.removeFromDOM(unrenderSelf: true)
        }
        
        // remove the current node
        remove()
        
        // remove from DOM
        if let htmlNode = self as? HTMLNode, unrenderSelf {
            _ = htmlNode.element?.remove?()
        }
        
        // remove from parent
        removeFromParent()
        
        // free children in memory
        self.children = []
        
    }
}
