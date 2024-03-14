//
//  EmptyRenderer.swift
//
//
//  Created by Joshua Davis on 3/12/24.
//

import Sailboat

struct EmptyRenderer: Renderable {

    func reconcile(with operator: any Sailboat.Operator) { }

    func addToParent(_ parentNode: any Element) { }
    
    func addBelow(_ node: any Element) { }

    func remove() { }
        
    func clearBody() { }
    
    func clearAttributes() { }
    
    func clearEvents() { }

    func replace(with renderable: any Element) { }
    
    func render() { }
    
    func updateAttribute(name: String, value: String) { }
        
}
