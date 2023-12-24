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

//protocol PageNodeProtocol {
//    func replace(_ page: any Operator)
//}

public typealias PageListNode = LinkedListNode<PageNode>


public class PageNode: CustomStringConvertible {

    /// child dom nodes contained by this HTMLElement, only one child (ie: body) for a Page
//    public var children: [PageNode]
    
    public var children: LinkedList<PageNode>
    
    /// weak reference to parent node in dom tree
//    weak public var parent: PageNode?
    
    ///
    weak public var node: LinkedListNode<PageNode>?
    
    ///
    weak public var aboveElement: JSObject?

    /// the page element for this node
    public var page: any Page
    
    public var description: String {
        "PageNode(type: \(type(of:self.page)), children: \(self.children.count))"
    }

    public init(
        page: any Page,
        aboveElement: JSObject
    ) {
        self.page = page
        
        self.aboveElement = aboveElement
        self.children = LinkedList()
        self.node = nil

    }
    
    public func print() {
        Swift.print(self.stackString(tabs: 4))
    }
    
    
    private func stackString(tabs: Int = 0) -> String {
        var output = ""
        let spaces = String(repeating: " ", count: tabs)
        
        if !children.isEmpty {
            output += spaces + self.description + " {" + "\n"
            
            for child in children {
                output += child.stackString(tabs: tabs + 4)
            }
            
            output += spaces + "}," + "\n"

        } else {
            output += spaces + self.description + "\n"
        }
        return output
    }
    
    public func compareTag(to page: any Page) -> Bool {
        return type(of: self.page) == type(of: page)
    }

    public func append(_ domNode: PageNode) {
        domNode.node = self.children.append(domNode)
        domNode.aboveElement = self.aboveElement
        
    }
    
    // TODO: make better with linked list
    public func removeFromParent() {
        // remove from parent
//        self.parent?.children.removeAll { $0 === self }
        self.node?.remove()
        
    }
    
    func replace(using page: any Page) {
        guard let aboveElement = aboveElement else { return }
        
        if let page = page as? any HTMLElement {
            replace(with:
                HTMLNode(
                    page: page,
                    aboveElement: aboveElement
                )
            )
        } else if let page = page as? any Operator {
            replace(with:
                OperatorNode(
                    page: page,
                    aboveElement: aboveElement
                )
            )
        } else {
            replace(with:
                CustomNode(
                    page: page,
                    aboveElement: aboveElement
                )
            )
        }
    }
    
    public func renderToDOM() {
        // TODO: any render things here
    }
    
    public func build() {
        
        // TODO: any build things here
        
        for child in self.children {
            child.build()
        }
        
        renderToDOM()
    }
    
    func replace(with pageNode: PageNode) {
        self.removeFromDOM()
//        self.removeFromParent()

        self.node?.replace(with: PageListNode(value: pageNode))
        
        self.build()
    }
    
    internal func remove() {
        // free children in memory
//        self.children = []
        
        self.children.clear()
        
    }
    
    public func removeFromDOM() {
        
        // remove current element & reference
        for child in self.children {
            child.removeFromDOM()
        }
        
        remove()
        
    }
 
}

