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

public class CustomNode: PageNode {

    override public var description: String {
        "PageNode(type: \(type(of:self.page)), children: \(self.children.count))"
    }
    
    public func replace(_ page: any Page) {
        
        self.removeFromDOM()
        self.removeFromParent()

        self.page = page
        
        // TODO:
//        BuildFactory.rebuild(self)
    }
 
}

