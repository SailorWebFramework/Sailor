//
//  String+Page.swift
//  
//
//  Created by Joshua Davis on 10/5/23.
//

import Sailboat

// TODO: this whole file make strings work as renderable elements

public struct StringRenderer: Renderable {
    
    public var id: String {
        return "STRING"
    }
    
    var value: String
    
    public var elementID: ElementID = "STRING"

    public init(_ value: String) {
        self.value = value
    }
    
    public func addToParent(_ parent: any Element) {
        guard let parentNode = parent.renderer as? JSNode else {
            return
        }
                
        parentNode.appendContent(text: self.value)
    }
    
    public func remove() { }
    
    public func remove(at deepIndex: Int) { }

    public func updateAttribute(name: String, value: String) { }
    
    public func renderEvents() { }
    
    public func renderAttributes() { }
    
    public func insertAfter(_ deepIndex: Int, parent: any Sailboat.Renderable) { }
    
    public func insertBefore(_ deepIndex: Int, parent: any Sailboat.Renderable) { }
    
    public func replace(at: Int, with: any Sailboat.Renderable) { }

}
