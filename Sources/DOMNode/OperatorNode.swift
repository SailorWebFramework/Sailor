//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/22/23.
//

import Foundation
import JavaScriptKit

public class OperatorNode: PageNode {
    
    public var id: UUID?
        
    override public var description: String {
        "OperatorNode(type: \(type(of:self.page)), id: \(self.id), children: \(self.children.count))"
    }
    
    init(
        page: any Operator,
        aboveElement: JSObject//,
        //parent: PageNode
    ) {
        self.id = page.id
        super.init(page: page, aboveElement: aboveElement)
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
