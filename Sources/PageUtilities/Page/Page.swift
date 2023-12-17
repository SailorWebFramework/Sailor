//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/16/23.
//

import Foundation

public protocol Page: Hashable, Equatable, CustomStringConvertible {
    associatedtype Body: Page
    
    /// body of the page element, resultBuilder can contain HTMLElements and custom Page elements
    var body: Body { get }
    
    ///
    func build(parentNode: DOMNode)

    ///
    func style(_ style: Style) -> any Page
    
    ///
    func attribute(_ type: Attribute, value: some AttributeValue) -> any Page
}
