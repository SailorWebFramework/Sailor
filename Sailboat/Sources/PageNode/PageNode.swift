//
//  File.swift
//
//
//  Created by Joshua Davis on 12/22/23.
//

//typealias AnyPage = any Page


//public typealias PageListNode = LinkedListNode<PageNode>

public protocol PageNode: AnyObject, CustomStringConvertible {
//    associatedtype PageType: Page
    
    // LinkedList<PageNode>
    ///
    var children: [any PageNode] { get set }
    
    ///
    //weak public var node: LinkedListNode<PageNode>?
    
    /// weak reference to parent node in dom tree
    var parent: (any PageNode)? { get set }
    
    
    // TODO:   do this to not make it any

    /// the page element for this node
    var page: any Page { get set }
    
    // MARK - create these functions in Classes
    
    /// unrender this specific node from the DOM
    func remove()
    
    /// add this specific node to the DOM
    func add()
    
    /// update this specific nodes elements and update dom
    func update(using page: any Page)
    
    func compare(to page: any Page) -> Bool
    
}

extension PageNode {
    
    internal func compareTag(to page: any Page) -> Bool {
        return type(of: self.page) == type(of: page)
    }
    
    internal func append(_ node: any PageNode) {
        self.children.append(node)
        node.parent = self
        
    }
    
    internal func insert(_ node: any PageNode, at index: Int) {
        self.children.insert(node, at: index)
        node.parent = self
        
    }
}
