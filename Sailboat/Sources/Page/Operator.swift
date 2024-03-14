//
//  Operator.swift
//  
//
//  Created by Joshua Davis on 12/22/23.
//

/// Operators are along the page tree and DOMNode Structure but are Hidden (not rendered) used to assist in rendering
public protocol Operator: Page {
    
    var hash: Int { get set }

    // children could be an enum with one page or a list of children
    var children: [any Page] { get set }
    
}

public extension Operator {
    var description: String {
        "Operator(type: \(type(of: self)), children: \(children.count)"
    }
}
