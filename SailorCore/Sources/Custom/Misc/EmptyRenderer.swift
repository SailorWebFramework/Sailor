//
//  EmptyRenderer.swift
//
//
//  Created by Joshua Davis on 3/12/24.
//

import Sailboat

struct EmptyRenderer: Renderable {
    var sailboatID: SailboatID? = nil

    func addToParent(_ parent: any Renderable) { }
    
    func setSailboatID(_ value: SailboatID?) { }
            
    func insertAfter(_ deepIndex: Int, parent: any Renderable) { }
    
    func insertBefore(_ deepIndex: Int, parent: any Renderable) { }
    
    func replace(at: Int, with: any Renderable) { }
        
    func remove() { }

    func remove(at deepIndex: Int) { }
            
    func addEvent(name: String, value: @escaping (EventResult) -> Void) { }

    func updateAttribute(name: String, value: any AttributeValue) { }

}
