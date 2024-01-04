//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/16/23.
//

// TODO: add a CustomPage and call it page in sailor?
public protocol Page: CustomStringConvertible {
    associatedtype Body: Page
    
    /// body of the page element, resultBuilder can contain HTMLElements and custom Page elements
    var body: Body { get }

}
