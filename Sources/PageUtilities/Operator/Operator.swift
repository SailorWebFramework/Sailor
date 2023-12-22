//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/22/23.
//

import Foundation

// TODO: ad an ID property??
// TODO: consider renaming
/// Operators are along the page tree and DOMNode Structure but are Hidden (not rendered) used to assist in rendering
public protocol Operator: Page {
    
    var children: [any Page] { get set }
    
    
}
