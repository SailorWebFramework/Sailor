//
//  String+Page.swift
//  
//
//  Created by Joshua Davis on 10/5/23.
//

import Sailboat

// TODO: this whole file make strings work as renderable elements

public struct StringRenderer: Renderable {
    var value: String
    
    public init(_ value: String) {
        self.value = value
    }
    
    public func addToParent(_ parent: any Element) {
        guard let parentNode = parent.renderer as? JSNode else {
            return
        }
        parentNode.editContent(text: self.value, append: true)
    }
    
    public func addChild(_ child: any Element) {
        child.renderer.addToParent(self.value as! (any Element))
    }
    
    public func remove() { }
    
    public func clear() { }
    
    public func replace(with renderable: any Element) { }
    
    public func updateAttribute(name: String, value: String) { }
        
    public func debugPrint() { print(self.value) }
    
    public func render() { }
}
