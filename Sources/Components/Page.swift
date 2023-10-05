//
//  File.swift
//  
//
//  Created by Joshua Davis on 10/3/23.
//

import Foundation
import SwiftSoup

public protocol Page {
    associatedtype Body: Page

    var body: Body { get }
    var style: Style { get set }
    
    /// className style
    func className(_ style: Style) -> Self
    
    /// inline style
    func styled(_ style: Style) -> Self

    func build(parent: Element?)


}

extension Page {
    public func build(parent: Element? = nil) {
        body.build(parent: parent)
    }
    
    public func className(_ style: Style) -> Self {
        return self
    }
    
    public func styled(_ style: Style) -> Self {
        return self
    }
    
    public func style(_ style: Style) -> Self {
        var copy = self
        copy.style = copy.style + style
        return copy
    }
}
