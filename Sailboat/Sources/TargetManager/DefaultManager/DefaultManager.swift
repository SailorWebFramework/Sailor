//
//  DefaultManager.swift
//  
//
//  Created by Joshua Davis on 12/30/23.
//

import Foundation

public final class ManagedEvent {
    ///
    public var semaphore: Int = 0
    ///
    public var states: Set<StateID> = []
    
}

public final class ManagedPages {
    ///
    public var elements: [ElementID: any Element] = [:]
    
    // TODO: i dont actually need to store the operator, i just need the hashes in order 
    ///
    public var children: [ElementID: any Operator] = [:]
    
    /// map of states to the pages they include
    public var stateElementMap: [StateID: Set<ElementID>] = [:]
    
    ///
//    public var elementStateMap: [ElementID: Set<StateID>] = [:]

    /// the current callback history of changed state values, use dump to clear the history
    public var stateHistory: Set<StateID> = []
}

// TODO: Rename to target manager and remove the old target manager??
/// Manager used for testing, does not render to DOM
open class DefaultManager {

    /// the global environment stored here
    public var environment: (any SomeEnvironment)? = nil
    
    // TODO: state objects here, or inside of environment
    public var objects: [StateID: ObservableObject] = [:]
    
    /// magages global data on a ran event
    public var managedEvent: ManagedEvent = .init()

    /// the stored pages in memory rendered currently
    public var managedPages: ManagedPages = .init()

    public init() { }
      
    open func build<GenericPage: Page>(page: GenericPage) {
        // ensure stateCallbackHistory is cleared
        _ = self.dump()

        // TODO: do i need this sema up and down?
        managedEvent.semaphore += 1
        
        print("Start Build: \(managedEvent.semaphore)")
        self.initialBuild(page: page)
        
        managedEvent.semaphore -= 1

    }
    
    open func update() {
        
        print("updating view...")
        
        for stateID in managedEvent.states {
            guard let elementIDs = managedPages.stateElementMap[stateID] else { continue }
                
            // body updates need a rerender of the body of the element
            for elementID in elementIDs {
                if let element = managedPages.elements[elementID] {
                    
                    // TODO: make helper function, managedEvent.semaUp() and down
                    managedEvent.semaphore += 1

                    // builds the shallow content body and adds its state to the watchers
                    let content: any Operator = element.content()
                    
                    // TODO:
                    // remove previous states dumped because it short circuits so theres no need to test it
                    // if a || b || c
                    // if a evaluates to true right now, i dont need to check b or c until a changes
                    SailboatGlobal.manager.dumpTo(element: element)
                    
                    // update attributes shallowly
                    element.renderer.render()
                    
                    //
                    element.renderer.reconcile(with: content)
                    
                    managedEvent.semaphore -= 1

                }
            }
        }
    }
    
    public func dumpTo(element: any Element) {
        let states = dump()
                
        for state in states {
            managedPages.stateElementMap[state, default: []].insert(element.id)
        }

    }
    
    // TODO: rename to like
    public func dumpDependency(state: any Stateful) {
        managedPages.stateHistory.insert(state.id)
    }
    
    public func dump() -> Set<StateID> {
        let copy = managedPages.stateHistory
        managedPages.stateHistory.removeAll()
        return copy
    }
    
    public func startEvent() {
        managedEvent.semaphore += 1
    }
    
    public func eventAdd<StateValue: Equatable>(state: State<StateValue>) {
        managedEvent.states.insert(state.id)
    }
    
    public func endEvent() {
        managedEvent.semaphore -= 1

        if managedEvent.semaphore == 0 {
            update()
        }
    }
    
    
    public func getElement(_ elementID: ElementID) -> (any Element)? {
        self.managedPages.elements[elementID]
    }
    
}
