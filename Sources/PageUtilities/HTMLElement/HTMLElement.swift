//
//  HTMLElement.swift
//  
//
//  Created by Joshua Davis on 10/3/23.
//

import Foundation
import JavaScriptKit

internal protocol HTMLElement: Page {
    /// HTML tag name, all lowercased
    var name: String { get }
    
    /// text content within HTML tag
    var content: String { get set }
    
    /// attributes on HTML tag
    var attributes: Attributes { get set }
    
    //TODO: make key not a string but a enum
    var events: Events { get set }
    
    /// children within HTML tags
    var children: [any Page] { get set }

    /// build and render the HTML page
    func build(parentNode: DOMNode)
    
    // TODO: NOT SURE IF I NEED THIS, CAN REMOVE
    ///
    func style(_ style: Style) -> any Page
    
    ///
    func attribute(_ type: Attribute, value: some AttributeValue) -> any Page
}
