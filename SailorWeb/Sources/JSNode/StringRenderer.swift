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
    
    public init(_ value: Value) {
        self.value = value
    }
    
    public func addToParent(_ parent: any Element) {
        guard let parentNode = parent.renderer as? JSNode else {
            return
        }
        parentNode.editContent(text: self.value.description, append: true)
    }
        
    public func addChild(_ child: any Element) {
        child.renderer.addToParent(self.value)
    }
    
    public func clearAttributes() { }
    
    public func clearEvents() { }
    
    public func reconcile(with operator: any Operator) { }
    
//    public func debugPrint() { print(self.value) }

    public func addBelow(_ node: any Element) { }
    
    public func remove() { }
    
//    public func clear() { }
    
    public func clearBody() { }

    public func replace(with renderable: any Element) { }
    
    public func updateAttribute(name: String, value: String) { }
            
    public func render() { }
}
