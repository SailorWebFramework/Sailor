//
//  File.swift
//  
//
//  Created by Joshua Davis on 3/13/24.
//

import Sailboat
#if os(WASI)
import SailorWeb
#else
//
#endif

// TODO: get string to work properly
extension String: Element {
    
    public var renderer: any Renderable {
        get { 
            #if os(WASI)
            StringRenderer(self)
            #else
            EmptyRenderer()
            #endif
        }
        set(newValue) { }
    }
    
    public var attributes: [String : String] {
        get { [:] }
        set(newValue) { }
    }
    
    public var events: [String : (EventResult) -> Void] {
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
