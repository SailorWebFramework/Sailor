//
//  String+Page.swift
//  
//
//  Created by Joshua Davis on 10/5/23.
//

import Foundation
import SwiftSoup

extension String: AttributeValue {
    public func render() -> String { self }
}

extension String: Page {
    // TODO: find a way for literals to work with attributes? maybe a global store
    public var attributes: Attributes {
        get { .init() }
        set {
            raise(Int32(kNSLNotImplementedYet))
        }
    }
    
    public var body: some Page { self }
    
    public func build(parent: SwiftSoup.Element? = nil) {
        do {
            // TODO: find a way for literals to work with style?
//            var element =
//            if !self.style.isEmpty {
//                try element.attr("style", self.style.renderInline())
//            }
            
            // TODO: Make \n \t work as expected by adding break tags and tab as expected
            try parent?.appendText(self)
            
        } catch {
            print("ERROR PARSING HTML")
        }
        
    }
}
