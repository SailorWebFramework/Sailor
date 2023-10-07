//
//  File.swift
//  
//
//  Created by Joshua Davis on 10/3/23.
//

import Foundation
import SwiftSoup

protocol HTMLElement: Page {
    var element: Element { get set }
    var children: [any Page] { get set }
    var content: String { get set }

}

extension HTMLElement {
    public func build(parent: Element? = nil) {
        do {
            // TODO: base URI?
            
            // add attributes
            for (key, value) in self.attributes {
                try element.attr(key.render(), value.render())
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
