////
////  OperatorNode.swift
////  
////
////  Created by Joshua Davis on 12/22/23.
////
//
//import Foundation
//
//final public class OperatorNode: PageNode {
//
//    public var id: UUID = UUID()
//
//    public var children: [any PageNode]
//    
//    weak public var parent: (any PageNode)?
//        
//    public var page: any Page
//    
////    public var id: String?
//    
//    public var description: String {
//        "OperatorNode(type: \(type(of:self.page)), id: \(self.id), children: \(self.children.count))"
//    }
//    
//    public init(
//        page: any Operator,
//        parent: (any PageNode)?
//    ) {
//        self.page = page
//
//        self.children = []
//        self.parent = parent
//
//    }
//    
//    public func add() { }
//    
//    public func remove() { }
//    
//    public func update(using page: any Page) {  }
//    
//    public func compare(to page: any Page) -> Bool {
//        guard let page = page as? any Operator else {
//            return false
//        }
//        if page.children.count != self.children.count {
//            return false
//        }
//        
//        return (0..<page.children.count).map { i in
//            children[i].compare(to: page.children[i])
//        }.allSatisfy {
//            $0
//        }
//
//    }
//    
//}
