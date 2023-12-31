////
////  File.swift
////
////
////  Created by Joshua Davis on 12/22/23.
////
//
//import Foundation
//import JavaScriptKit
//
//import Sailboat
//
////public typealias PageListNode = LinkedListNode<PageNode>
//
//public protocol PageNode: AnyObject, CustomStringConvertible {
//    
//    // LinkedList<PageNode>
//    ///
//    var children: [any PageNode] { get set }
//    
//    ///
//    //weak public var node: LinkedListNode<PageNode>?
//    
//    /// weak reference to parent node in dom tree
//    var parent: (any PageNode)? { get set }
//    
//    /// the parent of the current element in the DOM, if contains a psudo-element is the closest parent element. weak reference
//    var aboveElement: JSObject? { get set }
//
//    /// the page element for this node
//    var page: any Page { get set }
//    
//    // MARK - create these functions in Classes
//    
//    /// unrender this specific node from the DOM
//    func remove()
//    
//    /// add this specific node to the DOM
//    func add()
//    
//    /// update this specific nodes elements and update dom
//    func update(using page: any Page)
//    
//}
//
////extension PageNode {
////    deinit {
////        print("DEINITIALIZING \(self.description)")
////    }
////}
