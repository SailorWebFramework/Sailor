//
//  TargetManager.swift
//  
//
//  Created by Joshua Davis on 12/30/23.
//

/// Manager used for testing, does not render to DOM
open class TargetManager {

    /// the global environment stored here
    public var environment: (any SomeEnvironment)? = nil
    
    // TODO: state objects here, or inside of environment
    public var objects: [String: any ObservableObject] = [:]
    
    /// magages global data on a ran event
    public var managedEvent: ManagedEvent = .init()

    /// the stored pages in memory rendered currently
    public var managedPages: ManagedPages = .init()

    public init() { }
      
    open func build(page: any Element) {
        // ensure stateCallbackHistory is cleared
        _ = self.dump()
        
        // sema up + down to ensure the built state vars dont trigger an update
        managedEvent.semaphore += 1
                
        RenderableUtils.build(page)
        
        managedEvent.semaphore -= 1

    }
    
    open func update() {
        for stateID in managedEvent.states {
            let elements = managedPages.statefulElements[stateID] ?? []
            let attributes = managedPages.attributes[stateID] ?? []

            print("updating elements: \(elements)")
            print("updating attributes: \(attributes)")

            // body updates need a rerender of the body of the element
            for sailboatID in elements {
                if let renderer = managedPages.renderers[sailboatID],
                   let body = managedPages.bodies[sailboatID] {
                    
//                    print("State: \(stateID), Element: \(sailboatID)")
                    // TODO: rempve semaphore, i dont think it does anything...
                    // TODO: edit it stops updates, but seems a bit overkill...
                    managedEvent.semaphore += 1

                    // builds the shallow content body and adds its state to the watchers
                    let content: any Fragment = body()
                             
                    let states = dump()
                    
                    // TODO: consider removing previous states dumped because it short circuits so theres no need to test it :ex. if a || b || c ,, i dont need to check b or c until a changes
                    for state in states {
                        managedPages.statefulElements[state, default: []].insert(sailboatID)
                    }
                    
                    renderer.reconcile(with: content)
                                        
                    managedEvent.semaphore -= 1

                } else {
                    // remove elementID in states if it has been removed
                    managedPages.statefulElements[stateID]?.remove(sailboatID)
                }
            }
            
            // TODO: maybe consider batching these attribute updates somehow?
            for attribute in attributes {
                guard let renderer = self.managedPages.renderers[attribute.sid] else { return }
 
                renderer.renderAttributes([attribute.name: attribute.value])
            }
            
        }
    }
    
    // TODO: rename to like
    public func dumpDependency(state: any Stateful) {
        managedPages.stateHistory.insert(state.id)
    }
    
    // TODO: rename
    public func dump() -> Set<StateID> {
        let copy = managedPages.stateHistory
        managedPages.stateHistory.removeAll()
        return copy
    }
    
    // TODO: add to managedEvent
    public func startEvent() {
        managedEvent.semaphore += 1
    }
    
    // TODO: add to managedEvent
    public func eventAdd(state: some Stateful) {
        managedEvent.states.insert(state.id)
    }
    
    // TODO: add to managedEvent
    public func endEvent() {
        managedEvent.semaphore -= 1
        
        if managedEvent.semaphore == 0 {
            update()
        }
    }
    
}
