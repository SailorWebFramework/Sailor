//
//  String+Page.swift
//  
//
//  Created by Joshua Davis on 10/5/23.
//

import Sailboat

// TODO: this whole file make strings work as renderable elements

class StringRenderer: Renderable {
    public func addToParent(_ parentNode: Sailboat.Renderable) {
        
    }
    
    public func addChild(_ childNode: Sailboat.Renderable) {
        
    }
    
    public func remove() {
        
    }
    
    public func replace(with renderable: Sailboat.Renderable) { }
    
    public func addAttribute(name: String, value: String) { }
    
    public func addEvent(name: String, closure: @escaping (Sailboat.EventResult) -> Void) { }
    
}

// TODO: get string to work properly
extension String: Element {
//    public typealias Renderer = StringRenderer
    
    public var name: String { "str" }
    
    public var attributes: [String : String] {
        get { [:] }
        set(newValue) { }
    }
    
    public var events: [String : (Sailboat.EventResult) -> Void] {
        get { [:] }
        set(newValue) { }
    }
    
    public var content: Sailboat.TagContent {
        get {
            TagContent.text(self)
        }
        set(newValue) { }
    }
    
    public var id: ElementID {
        get {
            "STRING"
        }
        set(newValue) { }

    }
    
    public var body: some Page { self }
    
    public var renderer: some Renderable {
        get {
            JSNode()
        }
        set(newValue) { }
        
    }
    
    
}


//extension String: Oper {
//
//    public var body: some Page { self }
//
//}
