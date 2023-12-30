//
//  HTMLElement.swift
//  
//
//  Created by Joshua Davis on 10/3/23.
//

import Foundation

public enum TagContent {
    case text(String), list(() -> any Operator)
}

public protocol HTMLElement: Page {

    /// HTML tag name, all lowercased
    var name: String { get }
    
    /// attributes on HTML tag
    var attributes: Attributes { get set }
    
    /// event names and values attached to this HTMLElement
    var events: Events { get set }
    
    /// content within HTML tags
    var content: TagContent { get set }

    ///
    func style(_ properties: Style.Property...) -> Self
    
    ///
    func style(_ style: Style) -> Self

    ///
    func attribute(_ type: Attribute, value: some AttributeValue) -> Self
    
}
