//
//  String+Page.swift
//  
//
//  Created by Joshua Davis on 10/5/23.
//

import Sailboat

// TODO: this whole file make strings work as renderable elements

public struct StringRenderer<Value: Element>: Renderable {
    
    var value: Value
    
    public var elementID: ElementID = "STRING"

    public init(_ value: Value) {
        self.value = value
    }
    
    public func addToParent(_ parent: any Element) {
        guard let parentNode = parent.renderer as? JSNode else {
            return
        }
                
        parentNode.appendContent(text: self.value.description)
    }

    public func replace(at: Int, with: any Element) { }
    
    public func replace(with renderable: any Element) { }
    
    public func remove() { }
    
    public func remove(at deepIndex: Int) { }

    public func updateAttribute(name: String, value: String) { }
    
    public func renderEvents() { }
    
    public func renderAttributes() { }
    
    public func insertAfter(_ deepIndex: Int, parent: any Sailboat.Element) { }
    
    public func insertBefore(_ deepIndex: Int, parent: any Sailboat.Element) { }

}
