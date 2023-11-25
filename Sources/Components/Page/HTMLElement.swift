//
//  HTMLElement.swift
//  
//
//  Created by Joshua Davis on 10/3/23.
//

import Foundation
import JavaScriptKit

//TODO: replace usage of soup with JSKIT
protocol HTMLElement: Page {
    var element: JSValue { get set }
    var children: [any Page] { get set }
    var content: String { get set }
}

extension HTMLElement {
    // TODO: make description work instead of render?
    public var description: String { "TODO" }
  
    public func build(parent: JSValue) {
        var curElement = self.element

        // add content
        if !self.content.isEmpty {
            curElement.textContent = JSValue.string(self.content)
        }

        // add attributes
        for (key, value) in self.attributes {
            _ = curElement.setAttribute(key.description, value.description)
        }

        // add children
        for (_, child) in children.enumerated() {
            child.build(parent: curElement)
        }

        // add to DOM
        _ = parent.appendChild(curElement)

    }
    
}

//MARK - Hashable
extension HTMLElement {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(content)
        
        for child in children {
            hasher.combine(child)
        }
    }
}
