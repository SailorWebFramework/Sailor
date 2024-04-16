//
//  ManagedPages.swift
//  
//
//  Created by Joshua Davis on 3/14/24.
//

import Foundation

public struct ElementAttribute: Hashable {
    /// the sailboat id of the element
    let sid: SailboatID
    //TODO: rename this its not an action lol
    /// the attribute build action
    let action: () -> any AttributeValue
    /// the name of the attribute
    let name: String
    
    public static func == (lhs: ElementAttribute, rhs: ElementAttribute) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(sid)
        hasher.combine(name)
    }
    
}

public final class ManagedPages {
    ///
    public var renderers: [SailboatID: any Renderable] = [:]
    
    /// all bodies of stateful elements that could change throughout the lifecycle of the app
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
        element.renderer.setSailboatID(newSID)

        self.bodies[newSID] = element.content
        self.children[newSID] = operatorPage
        self.renderers[newSID] = element.renderer

        for state in states {
            self.statefulElements[state, default: []].insert(newSID)
        }
    }

    public func createSailboatID() -> String {
        UUID().uuidString
    }
    
}
