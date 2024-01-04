//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/26/23.
//

extension PageNode {
    
    /// replaces current node with a new node using specified page
    func replace(using page: any Page) {
        guard let parent = parent else {
            fatalError("parent does not exist")
        }

        guard let index = parent.children.firstIndex(where: { $0 === self }) else {
            fatalError("cant find self in parent node")
        }
        
        let newPageNode = Self.build(page: page, parent: nil)
        
        parent.insert(newPageNode, at: index)

    }
    
    
}
