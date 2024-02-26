//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/16/23.
//

// TODO: add a CustomPage and call it page in sailor?
public protocol Page: CustomStringConvertible {
    // todo: typeIdentifier here for signals
    associatedtype Body: Page
    
    /// body of the page element, resultBuilder can contain HTMLElements and custom Page elements
    var body: Body { get }

}

public extension Page {
    var description: String {
        "Page(type: \(type(of: self)))"
    }
}
