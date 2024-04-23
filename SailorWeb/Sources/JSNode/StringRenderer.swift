//
//  String+Page.swift
//  
//
//  Created by Joshua Davis on 10/5/23.
//

import Sailboat

// TODO: this whole file make strings work as renderable elements

public struct StringRenderer: Renderable {
    
    public var sailboatID: Sailboat.SailboatID? = nil

    public var value: String
    
    public init(_ value: String) {
        self.value = value
    }
    
    public func addToParent(_ parent: any Renderable) {
        guard let parentNode = parent as? JSNode else { return }
                
        parentNode.appendContent(text: self.value)
    }
    
    public func setSailboatID(_ value: SailboatID?) { }
    
    public func remove() { }
    
    public func remove(at deepIndex: Int) { }
    
    public func updateAttribute(name: String, value: any AttributeValue) { }
    
    public func addEvent(name: String, value: (EventResult) -> Void) { }
    
    public func insertAfter(_ deepIndex: Int, parent: any Renderable) { }
    
    public func insertBefore(_ deepIndex: Int, parent: any Renderable) { }
    
    public func replace(at: Int, with: any Renderable) { }

}
