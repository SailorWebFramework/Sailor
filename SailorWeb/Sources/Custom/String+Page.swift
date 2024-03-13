//
//  String+Page.swift
//  
//
//  Created by Joshua Davis on 10/5/23.
//

import Sailboat

// TODO: this whole file make strings work as renderable elements

struct StringRenderer: Renderable {
    var value: String
    
    init(_ value: String) {
        self.value = value
    }
    
    public func addToParent(_ parent: any Element) {
        guard let parentNode = parent.renderer as? JSNode else {
            return
        }
        parentNode.editContent(text: self.value, append: true)
    }
    
    public func addChild(_ child: any Element) {
        child.renderer.addToParent(self.value)
    }
    
    public func remove() { }
    
    public func clear() { }
    
    public func replace(with renderable: any Element) { }
    
    public func updateAttribute(name: String, value: String) { }
    
//    public func addEvent(name: String, closure: @escaping (EventResult) -> Void) { }
    
    public func debugPrint() { }
    
    public func render() { }
}

// TODO: get string to work properly
extension String: Element {
    
    public var renderer: any Renderable {
        get { StringRenderer(self) }
        set(newValue) { }
    }
    
    public var attributes: [String : String] {
        get { [:] }
        set(newValue) { }
    }
    
    public var events: [String : (Sailboat.EventResult) -> Void] {
        get { [:] }
        set(newValue) { }
    }
    
    public var content: () -> any Operator {
        get { { List([]) } }
        set(newValue) { }
    }
    
    public var id: ElementID {
        get { "STRING" }
        set(newValue) { }
    }
    
    public var body: some Page {
        fatalError("Infinitly recursing in String")
        return self
    }
    
}
