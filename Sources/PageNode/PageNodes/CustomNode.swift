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

final public class CustomNode: PageNode {
    
    public var children: [any PageNode]
    
    weak public var parent: (any PageNode)?
    
    weak public var aboveElement: JavaScriptKit.JSObject?
    
    public var page: any Page
    
    public var description: String {
        "PageNode(type: \(type(of:self.page)), children: \(self.children.count))"
    }
    
    public init(
        page: any Page,
        aboveElement: JSObject,
        parent: (any PageNode)? = nil
    ) {
        self.page = page

        self.aboveElement = aboveElement
        self.children = []
        self.parent = parent

    }
    
    public func add() { }
    
    public func remove() {  }

    public func update(using page: any Page) { }
    
//    public func replace(_ page: any Page) {
//        
//        self.removeFromDOM()
//        self.removeFromParent()
//
//        self.page = page
//        
//        // TODO:
////        BuildFactory.rebuild(self)
//    }
//    
    
 
}

