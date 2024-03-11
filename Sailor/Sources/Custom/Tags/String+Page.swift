//
//  String+Page.swift
//  
//
//  Created by Joshua Davis on 10/5/23.
//

import Sailboat

// TODO: this whole file make strings work as renderable elements

class StringRenderer: Renderable {
    var value: String
    
    init(_ value: String) {
        self.value = value
    }
    
    public func addToParent(_ parentNode: any Renderable) {
        guard let parentNode = parentNode as? JSNode else {
            print("PARENT ISNT A JSNODE")
            return
        }
        print("editing parent text to \(self.value)")

        parentNode.editContent(text: self.value, append: true)
    }
    
    public func addChild(_ childNode: Sailboat.Renderable) {
        childNode.addToParent(self)
    }
    
    public func remove() {
        
    }
    
    public func replace(with renderable: any Renderable) { }
    
    public func updateAttribute(name: String, value: String) { }
    
    public func addEvent(name: String, closure: @escaping (Sailboat.EventResult) -> Void) { }
    
    public func debugPrint() { }
    
    public func render(page: any Element) {
        
    }
}

// TODO: get string to work properly
extension String: Element {
//    public typealias Renderer = StringRenderer
    
    public var name: String { "STRING" }
    
    public var attributes: [String : String] {
        get { [:] }
        set(newValue) { }
    }
    
    public var events: [String : (Sailboat.EventResult) -> Void] {
        get { [:] }
        set(newValue) { }
    }
    
    public var content: (() -> any Operator)? {
        get {
            nil
        }
        set(newValue) { }
    }
    
    public var id: ElementID {
        get {
            self.name
        }
        set(newValue) { }

    }
    
    public var body: some Page { self }
    
    public var renderer: any Renderable {
        get {
            // TODO: make a custom renderer for string
            StringRenderer(self)
        }
        set(newValue) { }
        
    }
    
}


//extension String: Oper {
//
//    public var body: some Page { self }
//
//}
