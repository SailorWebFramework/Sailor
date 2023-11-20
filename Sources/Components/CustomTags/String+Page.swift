//
//  String+Page.swift
//  
//
//  Created by Joshua Davis on 10/5/23.
//

import Foundation
import JavaScriptKit
//import SwiftSoup

extension String: AttributeValue {
    public func render() -> String { self }
}

extension String: Page {
    // TODO: find a way for literals to work with attributes? maybe a global store
    public var attributes: Attributes {
        get { .init() }
        set {
            print("STRING:PAGE NOT IMPLEMENTED SET")
            // raise(Int32(kNSLNotImplementedYet))
        }
    }
    
    public var body: some Page { self }
    
    // overrides render
    public func render(id: String?) -> String {
        return "<span \(self.attributes.render())>\(self)</span>\n"
    }
    
    public func build(parent: JSValue) {
        do {
            // TODO: find a way for literals to work with style?
//            var element =
//            if !self.style.isEmpty {
//                try element.attr("style", self.style.renderInline())
//            }
            
            // TODO: Make \n \t work as expected by adding break tags and tab as expected
            // TODO: READD WITH JSKIT
            
            
        } catch {
            print("ERROR PARSING HTML")
        }
        
    }
}
