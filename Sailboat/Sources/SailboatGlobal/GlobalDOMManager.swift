//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/30/23.
//

import Foundation

public protocol GlobalDOMManager {
    var states: LinkedList<StateValue> { get set }
    var body: CustomNode? { get set }
    var head: CustomNode? { get set }

    func build(page: any Page)

    func update()
}

extension GlobalDOMManager {
    
    /// updates the global state, override this to diff DOM
    public func update(state: StateNode, newValue: StateValue) {
        state.value = newValue
        
        update()
    }
}
