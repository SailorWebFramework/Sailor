//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/22/23.
//

// TODO: consider renaming
/// Operators are along the page tree and DOMNode Structure but are Hidden (not rendered) used to assist in rendering
public protocol Operator: Page, Identifiable where ID == String {
    
    // children could be an enum with one page or a list of children
    var children: [any Page] { get set }
    var id: ID { get set }
    
    // TODO:
//    var staticMember: Bool { get set }
//    var route: String? { get set }
    
}

public extension Operator {
    var description: String {
        "Operator(type: \(type(of: self)), id: \(self.id), children: \(children.count)"
    }
}
