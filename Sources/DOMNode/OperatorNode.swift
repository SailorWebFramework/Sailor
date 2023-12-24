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
    
    // TODO: make element here and maybe page? weak eleement
    
    init(
        page: any Operator,
        element: JSObject,
        parent: DOMNode? = nil
    ) {
        self.id = page.id
        super.init(page: page, element: element, parent: parent)
    }
    
    func compareTag(to page: any Operator) -> Bool {
        return page.id == self.id
    }
    
    
}
