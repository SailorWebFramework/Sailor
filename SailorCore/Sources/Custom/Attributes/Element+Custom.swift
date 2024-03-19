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
    func classes(_ values: String...) -> Self {
        attribute(.init(name: "class", value: values.joined(separator: " ") + " "), override: false)
    }
    
    ///Defines a unique identifier for the element.
    func id(_ value:  String) -> Self {
        var copy = self
        
        if value == copy.id { return self }
        
        copy.id = value
        
        // TODO: remove this only use element id property?
        copy.attributes["id"] = value
        
        // TODO: only add when its a state property or a custom page?
        copy.renderer.elementID = value
        
        return copy
    }
    
    // TODO: more custom methods?
    // ...

}
