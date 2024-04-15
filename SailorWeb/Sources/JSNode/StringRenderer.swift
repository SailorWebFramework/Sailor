//
//  String+Page.swift
//  
//
//  Created by Joshua Davis on 10/5/23.
//

import Sailboat

// TODO: this whole file make strings work as renderable elements

public struct StringRenderer: Renderable {
    public func setSailboatID(_ value: Sailboat.SailboatID?) { }
    
    public var sid: Sailboat.SailboatID? = nil
    
    public func updateAttribute(name: String, value: any Sailboat.AttributeValue) {
        
    }
    
    public func addEvent(name: String, value: (Sailboat.EventResult) -> Void) {
        
    }
    
    
//    public var id: String {
//        return "STRING"
//    }
    
    var value: String
    
//    public var elementID: SailboatID = "STRING"

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
