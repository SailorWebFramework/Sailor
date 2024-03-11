//
//  DefaultManager.swift
//  
//
//  Created by Joshua Davis on 12/30/23.
//

import Foundation

public struct ManagedEvent {
    public var semaphore: Int = 0
    public var states: [StateID] = []
}

public struct ManagedPage {
    public var currentElement: (any Element)? = nil
    public var parentElement: (any Element)? = nil
    public var currentPage: (any Page)? = nil
}

/// Manager used for testing, does not render to DOM
open class DefaultManager: TargetManager {

//    public var body: (any PageNode)? = nil
    public var environment: (any SomeEnvironment)? = nil
    
    // TODO: state objects here, or inside of environment
    public var objects: [StateID: ObservableObject] = [:]
    
    public var managedPage: ManagedPage = .init()
    
    public var managedEvent: ManagedEvent = .init()
    
    public var stateCallbackHistory: [StateID] = []
    
    public var elements: [ElementID: any Element] = [:]
    
    /// map of states to the pages they include
    public var stateToPagesMap: [StateID: [ElementID]] = [:]
    
    public init() { }
    
//    private struct BasePageWrapper<T: Page>: Page {
//        var page: T
//
//        var body: some Page {
//            page
//        }
//    }
//    
    open func build<GenericPage: Page>(page: GenericPage) {
        // ensure stateCallbackHistory is cleared
        _ = self.dump()
        
//        self.body = self.build(page: page, parent: nil)
        managedEvent.semaphore += 1
        
        print("Start Build: \(managedEvent.semaphore)")
        self.initialBuild(page: page)
        
        managedEvent.semaphore -= 1

    }
    
    // TODO: func update(states: [UUID])
    open func update() {
        
        print("updating view...")
        
        print(managedEvent.states)
        print(stateToPagesMap)
        print(elements)

        for stateID in managedEvent.states {
            if let elementIDs = stateToPagesMap[stateID] {
                
                // body updates need a rerender of the body of the element
                for elementID in elementIDs {
                    if let element = elements[elementID] {
                        managedEvent.semaphore += 1

                        print("STARTING UPDATE OF \(element)")

//                        element.renderer.remove()
//                        element.renderer.render(page: element)

                        print("REMOVED SUCESSFULLY")
                        
                        // builds the shallow content body and adds its state to the watchers
                        if let content = element.content?() {
                            print("ADDING TO GLOBAL")
                            
//                            SailboatGlobal.manager.dumpTo(element: element)
                            
                            print("ATTEMPTING TO BUILD BODY")
                            // TODO: remove the old states in the states map and append these dumped
                            
                            
//                            element.renderer.build(page: content, parent: element)
                        }
                        
                        print("NO CONTENT")
                        
                        managedEvent.semaphore -= 1

                    }
                }
            }
        }
    }
    
    public func dumpTo(element: any Element) {
        let states = dump()
        
        
        print(stateToPagesMap)
        
        for state in states {
            stateToPagesMap[state, default: []].append(element.id)
        }
        
        // todo: ?
//        self.elements[element.id] =
        
        if !states.isEmpty {
            print("REGISTERED \(element)")
            print(stateToPagesMap)
            print(elements)
        }

    }
    
    // TODO: rename to like
    public func dumpDependency(state: any Stateful) {
        stateCallbackHistory.append(state.id)

    }
    
    public func dump() -> [StateID] {
        let copy = stateCallbackHistory
        stateCallbackHistory.removeAll()
        return copy
    }
    
    public func startEvent() {
        managedEvent.semaphore += 1
        print("semaphore up \(managedEvent.semaphore)")

    }
    
    public func eventAdd<StateValue: Equatable>(state: State<StateValue>) {
        managedEvent.states.append(state.id)
    }
    
    public func endEvent() {
        managedEvent.semaphore -= 1
        print("semaphore down \(managedEvent.semaphore)")

        if managedEvent.semaphore == 0 {
            update()
//            print("I WOULD UPDATE BUT NO")
        }
    }
    
}
