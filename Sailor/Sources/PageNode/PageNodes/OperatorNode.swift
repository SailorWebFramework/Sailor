//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/22/23.
//

import Foundation
import JavaScriptKit

import Sailboat

final public class OperatorNode: PageNode {

    public var children: [any PageNode]
    
    weak public var parent: (any PageNode)?
    
    weak public var aboveElement: JavaScriptKit.JSObject?
    
    public var page: any Page
    
    public var id: UUID?
    
    public var description: String {
        "OperatorNode(type: \(type(of:self.page)), id: \(self.id), children: \(self.children.count))"
    }
    
    
    public init(
        page: any Operator,
        aboveElement: JSObject,
        parent: (any PageNode)?
    ) {
        self.page = page

        self.aboveElement = aboveElement
        self.children = []
        self.parent = parent

    }
    
    public func add() {
        
    }
    
    public func remove() {
        
    }
    
    public func update(using page: any Page) {
        
    }
   

    
//    public func replace(_ page: any Operator) {
//        
//        self.removeFromDOM()
//        self.removeFromParent()
//
//        self.page = page
//        
////        BuildFactory.rebuild(self)
//    }
//    
//    func compareTag(to page: any Operator) -> Bool {
//        return page.id == self.id
//    }
    
}
