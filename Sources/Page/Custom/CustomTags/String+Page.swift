//
//  String+Page.swift
//  
//
//  Created by Joshua Davis on 10/5/23.
//

import JavaScriptKit

extension String: AttributeValue { }

extension String: Page {
    // TODO: find a way for literals to work with attributes? maybe a global store
    public var attributes: Attributes {
        get { .init() }
        set {
            print("STRING:PAGE NOT IMPLEMENTED SET")
        }
    }
    
    public var body: some Page { self }
    
    // TODO: remake
    // public func build(parent: JSValue, virtualDOM: DOMNode) {
    //     // TODO: Make \n \t work as expected by adding break tags and tab as expected
    //     // TODO: find a way for literals to work with style & attrubutes?
        
    //     var curElement = App.document.createElement("p")

    //     // add content
    //     if !self.isEmpty {
    //         curElement.textContent = JSValue.string(self)
    //     }
        
    //     _ = parent.appendChild(curElement)

    // }
}
