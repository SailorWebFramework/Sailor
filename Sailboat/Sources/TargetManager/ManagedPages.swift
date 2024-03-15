//
//  ManagedPages.swift
//  
//
//  Created by Joshua Davis on 3/14/24.
//

public final class ManagedPages {
    /// all stateful elements that could change throughout the lifecycle of the app
    public var elements: [ElementID: any Element] = [:]
    
    // TODO: i dont actually need to store the operator, i just need the hashes in order
    // TODO: edit, Think on this, i might need the old values because of the renderers
    // TODO: would be sick if i didnt could probably get the elements from the root element from the DOM
    /// the rendered children of the operator nodes of stateful elements
    public var children: [ElementID: any Operator] = [:]
    
    /// map of states to the pages they include
    public var stateElementMap: [StateID: Set<ElementID>] = [:]
    
    /// the current callback history of changed state values, use dump to clear the history
    public var stateHistory: Set<StateID> = []
}
