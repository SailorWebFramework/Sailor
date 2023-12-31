//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/22/23.
//

import Foundation

// TODO: consider renaming
/// Operators are along the page tree and DOMNode Structure but are Hidden (not rendered) used to assist in rendering
public protocol Operator: Page, Identifiable {
    
    // children could be an enum with one page or a list of children
    var children: [any Page] { get set }
    var id: UUID { get set }
    
    // TODO:
//    var staticMember: Bool { get set }
//    var route: String? { get set }
    
}
