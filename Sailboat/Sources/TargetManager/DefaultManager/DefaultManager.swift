//
//  DefaultManager.swift
//  
//
//  Created by Joshua Davis on 12/30/23.
//

import Foundation

public struct ManagedEvent {
    public var isStarted: Bool = false
    public var states: [StateID] = []
}

public struct ManagedPage {
    public var currentElement: (ElementNode)? = nil
    public var parentElement: (ElementNode)? = nil
    public var currentPage: (CustomNode)? = nil
}

/// Manager used for testing, does not render to DOM
open class DefaultManager: TargetManager {

    public var body: (any PageNode)? = nil
    public var environment: (any SomeEnvironment)? = nil
    
    // TODO: state objects here, or inside of environment
    public var objects: [StateID: any Equatable] = [:]
    
    public var managedPage: ManagedPage = .init()
    
    public var managedEvent: ManagedEvent = .init()
    
    public var stateCallbackHistory: [StateID] = []
    
    public var elements: [ElementID: ElementNode] = [:]
    
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
        // ensire stateCallbackHistory is cleared
        let leaks = self.dump()
        
        print("Leaks")
        print(leaks)
        
        self.body = self.build(page: page, parent: nil)

    }
    
    
    // TODO: func update(states: [UUID])
    open func update() {
        var updatedPageNodes: [any PageNode] = []
        
//        stateToPagesMap
//        for stateID in managedEvent.states {
//            if let pageNodes = stateToPagesMap[stateID] {
//                if pageNodes.isEmpty {
//                    print("PAGENODE NOT FOUND FOR STATE \(stateID)")
//                    continue
//                }
//
//                for node in pageNodes {
//                    if let customNode = node as? CustomNode,
//                       !updatedPageNodes.contains(where: { $0.id == customNode.id }) {
//
//                        updateShallow(node: customNode)
//                        updatedPageNodes.append(customNode)
//
//                        print("ONLY UPDATEING \(customNode)")
//                    } else {
//                        print("SKIPPING \(node) Already Updated")
//
//                        if !(node is CustomNode) {
//                            fatalError("CUSTOM NODE ISNT CUSTOM \(node)")
//                        }
//                    }
//                }
//
//            }
//        }
        
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
        }
        
        // todo: ?
//        self.elements[element.id] =
        
        if !states.isEmpty {
            print("REGISTERED \(element)")
            print(stateToPagesMap)
            print(elements)
        }

    }
    
    public func startEvent() {
        managedEvent.isStarted = true
    }
    
    public func eventAdd<StateValue: Equatable>(state: State<StateValue>) {
        managedEvent.states.append(state.id)
    }
    
    // TODO: rename to like 
    public func dumpDependency(state: any Stateful) {
        stateCallbackHistory.append(state.id)

    }
    
    public func dump() -> [StateID] {
        var copy = stateCallbackHistory
        stateCallbackHistory.removeAll()
        return copy
    }
    
    public func endEvent() {
        managedEvent.isStarted = false
        
        update()
    }
    
}
