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
    ///One or more class names defined as a class style.
//    func classes(_ values: String...) -> Self {
//        attribute(.init(name: "class", value: values.joined(separator: " ") + " "), override: false)
//    }
    
    func className(_ value: @escaping () -> String) -> Self {
        attribute(.init(name: "class", value: value), override: false)
    }
    
    ///Defines a unique identifier for the element.
    func id(_ value: @escaping () -> String) -> Self {
        attribute(.init(name: "id", value: value), override: true)

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
