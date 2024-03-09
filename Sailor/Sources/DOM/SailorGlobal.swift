//
//  File.swift
//  
//
//  Created by Joshua Davis on 3/8/24.
//

import Sailboat

/// Sailor Specific global environment
enum SailorGlobal {
    /// head "stack" should be pushed and popped when items appear and disappear
    static var headItems: [ElementID: any Operator] = [:]
    
}
