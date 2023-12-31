//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/22/23.
//

import Foundation

final public class OperatorNode: PageNode {

    public var children: [any PageNode]
    
    weak public var parent: (any PageNode)?
        
    public var page: any Page
    
    public var id: UUID?
    
    public var description: String {
        "OperatorNode(type: \(type(of:self.page)), id: \(self.id), children: \(self.children.count))"
    }
    
    public init(
        page: any Operator,
        parent: (any PageNode)?
    ) {
        self.page = page

        self.children = []
        self.parent = parent

    }
    
    public func add() { }
    
    public func remove() { }
    
    public func update(using page: any Page) {  }
    
}
