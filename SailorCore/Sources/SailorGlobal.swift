//
//  File.swift
//  
//
//  Created by Joshua Davis on 3/8/24.
//

import Sailboat

/// Sailor Specific global environment
enum SailorGlobal {
    /// head
    static var headRef: (Head)! = nil
    
    static func initialize(head: Head) {
        Self.headRef = head
        
        RenderableUtils.build(
            page: headRef.content(),
            parent: Self.headRef
        )
    }
}
