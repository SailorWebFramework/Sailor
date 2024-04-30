//
//  SailorGlobal.swift
//
//
//  Created by Joshua Davis on 3/8/24.
//

import Sailboat

/// Sailor Specific global environment
enum SailorGlobal {
    /// global head page/element refrence in sailor
    static var headRef: (any Head)! = nil
    
    static func initialize(head: any Head) {
        Self.headRef = head
        
        RenderableUtils.build(
            page: headRef.content(),
            parent: Self.headRef
        )
    }
}
