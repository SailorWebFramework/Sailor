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

    // TODO: more custom methods?
    // ...

}
