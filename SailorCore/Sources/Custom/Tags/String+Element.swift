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
extension String: ValueElement, BodyPage, HeadPage {
//    public static var name: String { }
    
    public var value: String { self }
    
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
    
    public var attributes: [String : () -> any AttributeValue] {
        get { [:] }
        set(newValue) { }
    }
    
    public var events: [String : (EventResult) -> Void] {
        get { [:] }
        set(newValue) { }
    }
    
    public var content: () -> any Fragment {
        get { { List() } }
        set(newValue) { }
    }
    
    public var sid: SailboatID? {
        get { nil }
        set(newValue) { }
    }
    
}
