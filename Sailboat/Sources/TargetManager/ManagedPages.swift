//
//  ManagedPages.swift
//  
//
//  Created by Joshua Davis on 3/14/24.
//

import Foundation

public struct ElementAttribute: Hashable {
    public static func == (lhs: ElementAttribute, rhs: ElementAttribute) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(sid)
        hasher.combine(name)

    }
    
    /// the sailboat id of the element
    let sid: SailboatID
    ///
    let action: () -> any AttributeValue
    /// the name of the attribute
    let name: String
}

public final class ManagedPages {
    /// all stateful elements that could change throughout the lifecycle of the app
//    public var elements: [SailboatID: any Element] = [:]
    
    public var renderers: [SailboatID: any Renderable] = [:]
    
    public var bodies: [SailboatID: () -> any Fragment] = [:]

    /// references to element attributes that are neccisary for state certian changes
    public var attributes: [StateID: Set<ElementAttribute>] = [:]

    // TODO: i dont actually need to store the operator, i just need the hashes in order
    // TODO: edit, Think on this, i might need the old values because of the renderers
    // TODO: would be sick if i didnt could probably get the elements from the root element from the DOM
    /// the rendered children of the operator nodes of stateful elements
    public var children: [SailboatID: any Fragment] = [:]
    
    /// map of states to the pages they include
    public var statefulElements: [StateID: Set<SailboatID>] = [:]
    
    /// the current callback history of changed state values, use dump to clear the history
    public var stateHistory: Set<StateID> = []
    
    public func registerElement(_ element: any Element, _ operatorPage: any Fragment) {
        let states = SailboatGlobal.manager.dump()
        
        if states.isEmpty { return }
        
        let newSID = createSailboatID()
        self.bodies[newSID] = element.content
        self.children[newSID] = operatorPage
        
        element.renderer.setSailboatID(newSID)
        
        for state in states {
            self.statefulElements[state, default: []].insert(newSID)
        }
    }
    
//    public func registerAttribute(_ name: String) {
//        let newSID = createSailboatID()
//        self.attributes[] = element
//        
//    }
    
    public func createSailboatID() -> String {
        UUID().uuidString
    }
    
}
