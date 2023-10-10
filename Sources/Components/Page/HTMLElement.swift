//
//  File.swift
//  
//
//  Created by Joshua Davis on 10/3/23.
//

import Foundation
import SwiftSoup

//TODO: replace usage of soup with JSKIT

protocol HTMLElement: Page {
//    var elementID: String
    var element: Element { get set }
    var children: [any Page] { get set }
    var content: String { get set }

}

extension HTMLElement {
    // TODO: make description work
    public var description: String { "TODO" }

    public func build(parent: Element? = nil) {
        do {
            // TODO: base URI?
            // add attributes
            for (key, value) in self.attributes {
                try element.attr(key.description, value.description)
            }
                        
            // add content
            if !self.content.isEmpty {
                try element.text(self.content)
            }

            // add to parent
            try parent?.appendChild(element)
            
            // loop over children component if any
            for child in children {
                child.build(parent: element)
            }
                        
        } catch {
            // TODO: throw meaningful errors
            print("ERROR PARSING HTML")
        }
        
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
