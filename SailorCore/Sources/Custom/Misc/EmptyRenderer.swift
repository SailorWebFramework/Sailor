//
//  EmptyRenderer.swift
//
//
//  Created by Joshua Davis on 3/12/24.
//

import Sailboat

struct EmptyRenderer: Renderable {
    var elementID: ElementID = "EMPTY"

    func remove(at deepIndex: Int) { }
    
    func insertAfter(_ deepIndex: Int, parent: any Sailboat.Element) { }
    
    func insertBefore(_ deepIndex: Int, parent: any Sailboat.Element) { }
    
    func replace(at: Int, with: any Element) { }
    
    func reconcile(with operator: any Sailboat.Fragment) { }

    func addToParent(_ parentNode: any Element) { }
    
    func remove() { }
        
    func clearBody() { }
    
    func clearAttributes() { }
    
    func clearEvents() { }

    func replace(with renderable: any Element) { }
    
    func render() { }
    
    func updateAttribute(name: String, value: String) { }
    
    public func renderEvents() {
        
    }
    
    public func renderAttributes() {
        
    }
        
}
