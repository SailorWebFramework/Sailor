//
//  DefaultManager.swift
//  
//
//  Created by Joshua Davis on 12/30/23.
//

import Foundation

public struct ManagedEvent {
    fileprivate var semaphore: Int = 0
    fileprivate var states: [StateID] = []
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
    public var stateToPagesMap: [StateID: (body: [ElementID], local: [ElementID])] = [:]
    
    public init() { }
    
    private struct BasePageWrapper<T: Page>: Page {
        var page: T

        var body: some Page {
            page
        }
    }
    
    open func build<GenericPage: Page>(page: GenericPage) {
        // ensure stateCallbackHistory is cleared
        _ = self.dump()
        
//        self.body = self.build(page: page, parent: nil)
        self.build(page: page)

    }
    
    
    // TODO: func update(states: [UUID])
    open func update() {
        
        print("updating view...")
        
        print(managedEvent.states)
        print(stateToPagesMap)
        print(elements)

        for stateID in managedEvent.states {
            if let (bodyUpdates, localUpdates) = stateToPagesMap[stateID] {
                
                // body updates need a rerender of the body of the element
                for elementID in bodyUpdates {
                    if let element = elements[elementID] {
                        element.renderer.render(page: element)
                        
//                        element.renderer.build(page: element)
//                        element.renderer.
                    }
                }
                
                // TODO: this doesnt work because not lazy loaded content or attributes
                // local updates are text, attributes, and events?
                for elementID in localUpdates {
                    if let element = elements[elementID] {
                        element.renderer.render(page: element)
                    }
                }
            }
        }
    }
    
    public func dumpTo(element: any Element) {
        dumpTo(element: element, toBody: true)
    }
    
    public func dumpTo(element: any Element, toBody: Bool) {
        let states = dump()
        
        for state in states {
            if toBody {
                stateToPagesMap[state, default: (body: [ElementID](), local: [ElementID]())].body.append(element.id)
            } else {
                stateToPagesMap[state, default: (body: [ElementID](), local: [ElementID]())].local.append(element.id)
            }
            
//            self.elements[element.id] = element
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
        }
    }
    
}
