//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/16/23.
//

import Foundation

public protocol Page: CustomStringConvertible {
    associatedtype Body: Page
    
    /// body of the page element, resultBuilder can contain HTMLElements and custom Page elements
    var body: Body { get }
    
    // TODO: remove build from Page & HTMLElement, make like a BuildPage class so its hidden
    ///
    func build(parentNode: DOMNode)

}
