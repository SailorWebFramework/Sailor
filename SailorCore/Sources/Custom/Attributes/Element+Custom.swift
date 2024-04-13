//
//  File.swift
//  
//
//  Created by Joshua Davis on 2/9/24.
//

import Sailboat

#if os(WASI)
import SailorWeb
#else
//
#endif

public extension Element {
    
    /// inline css styles
    func style(@StyleBuilder _ value: @escaping () -> any StyleContainer) -> Self {
        attribute(.init(name: "style", value: value), override: false)
    }
    
    ///One or more class names defined as a class style.
    func classes(@ClassBuilder _ value: @escaping () -> any DynamicClassContainer) -> Self {
        attribute(.init(name: "class", value: value), override: false)
    }

    ///Defines a unique identifier for the element.
    func id(_ value: @escaping () -> String) -> Self {
        attribute(.init(name: "id", value: value), override: true)

        // TODO: all the stuff bleow this idk what it means just delete...
//        var copy = self
//        
////        if value == copy.id { return self }
//        
//        // TODO: also make it set the element id property, or remove it?
////        copy.id = value
//        
//        // TODO: remove this only use element id property?
//        copy.attributes["id"] = value
//        
//        // TODO: add this back with func
////        copy.renderer.elementID = value
//        
//        return copy
    }
    
    // TODO: more custom methods?
    // ...

}
