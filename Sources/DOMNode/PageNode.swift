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
//    public var children: [PageNode]
    
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
        aboveElement: JSObject//,
//        parent: PageNode?
    ) {
        self.page = page
        
        self.aboveElement = aboveElement
        self.children = LinkedList()
        self.node = nil

//        self.children = []
//        self.parent = parent

    }
    
    public func printNode() {
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
        Swift.print("PRE REPLACE")
        self.removeFromDOM()

        if let page = page as? any HTMLElement {
            replace(with:
                HTMLNode(
                    page: page,
                    aboveElement: aboveElement,
                    element: (self as? HTMLNode)?.element
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
    
    public func update(using page: any Page) {
        // TODO: ?
    }
    
    private func replace(with pageNode: PageNode) {
        Swift.print("REPLACING")

        pageNode.build()
        
//        pageNode.printNode()
        
        if let node = self.node {
            let anode = PageListNode(value: pageNode)
            print("NODE!!!!, \(anode)")
            node.replace(with: anode)

        }
        
        Swift.print("BUILIDNG")
    }
    
    
    // TODO: REMOVE & REMOVE FROM DOM NOT WORKING MAKES HANG
    internal func remove() {
        // free children in memory
//        self.children = []
        
        Swift.print("CLEAING LL")
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

