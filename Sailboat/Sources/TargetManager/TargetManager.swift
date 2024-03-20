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
    public var objects: [StateID: ObservableObject] = [:]
    
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
        
        print("elements...")
        
        print(managedPages.elements)
        print("children...")

        print(managedPages.children)

        print("map...")

        print(managedPages.stateElementMap)

        for stateID in managedEvent.states {
            guard let elementIDs = managedPages.stateElementMap[stateID] else { continue }
                
            // body updates need a rerender of the body of the element
            for elementID in elementIDs {
                if let element = managedPages.elements[elementID] {
                    
                    print("State: \(stateID), Element: \(element)")
                    
                    managedEvent.semaphore += 1

                    // builds the shallow content body and adds its state to the watchers
                    let content: any Fragment = element.content()
                    
                    // TODO:
                    // remove previous states dumped because it short circuits so theres no need to test it
                    // if a || b || c
                    // if a evaluates to true right now, i dont need to check b or c until a changes
                    SailboatGlobal.manager.dumpTo(element: element)
                    
                    // update attributes shallowly and reconcile body
                    element.renderer.render()
                    element.renderer.reconcile(with: content)
                    
                    managedEvent.semaphore -= 1

                } else {
                    // remove elementID in states if it has been removed
                    managedPages.stateElementMap[stateID]?.remove(elementID)
                }
            }
        }
    }
    
    // TODO: move all these to managed page and managed event
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
