////
////  CustomNode.swift
////
////
////  Created by Joshua Davis on 12/22/23.
////
//import Foundation
//
//final public class CustomNode: PageNode {
//    
//    public var id: UUID = UUID()
//    
//    public var children: [any PageNode]
//    
//    weak public var parent: (any PageNode)?
//        
//    public var page: any Page
//    
//    public var description: String {
//        "PageNode(type: \(type(of:self.page)), children: \(self.children.count))"
//    }
//    
//    public init(
//        page: any Page,
//        parent: (any PageNode)? = nil
//    ) {
//        self.page = page
//        self.children = []
//        self.parent = parent
//
//    }
//    
//    public func compare(to page: any Page) -> Bool {
//        compareTag(to: page)
//    }
//    
//    public func add() { }
//    
//    public func remove() {  }
//
//    public func update(using page: any Page) { }
//    
//}
//
