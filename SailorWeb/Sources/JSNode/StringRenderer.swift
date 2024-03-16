//
//  String+Page.swift
//  
//
//  Created by Joshua Davis on 10/5/23.
//

import Sailboat

// TODO: this whole file make strings work as renderable elements

public struct StringRenderer<Value: Element>: Renderable {
    public func remove(at deepIndex: Int) {
        
    }
    
    public func insertAfter(_ deepIndex: Int, parent: any Sailboat.Element) {
        
    }
    
    public func insertBefore(_ deepIndex: Int, parent: any Sailboat.Element) {
        
    }
    
    public func addBelow(_ index: Int, parent: any Sailboat.Element) {
        
    }
    
    public func addBelow(_ index: Int) {
        
    }
    
    public func replace(at: Int, with: any Element) { }
    
    var value: Value
    
    public var elementID: ElementID = "STRING"

    public init(_ value: Value) {
        self.value = value
//        self.parent = nil
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
    
    // TODO: remove these 2
    public func clearAttributes() { }
    
    public func clearEvents() { }
    
    
//    public func reconcile(with operator: any Operator) { }
    
//    public func debugPrint() { print(self.value) }

    public func addBelow(_ node: any Element) { }
    
    public func remove() { }
    
//    public func clear() { }
    
    public func clearBody() { }

    public func replace(with renderable: any Element) { }
    
    public func updateAttribute(name: String, value: String) { }
            
    public func render() { }
}
