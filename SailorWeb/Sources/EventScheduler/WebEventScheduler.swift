//
//  File.swift
//  
//
//  Created by Joshua Davis on 4/28/24.
//

import Sailboat
import JavaScriptKit

// TODO: make helper function, managedEvent.semaUp() and down
public final class WebEventScheduler: EventScheduler {
    /// decides if a state change triggers an update, waits for all events to complete before and batches updating
//    public var semaphore: Int = 0
    /// the states changed in the current managed event
    public var states: Set<StateID> = []
    ///
//    internal var events: LinkedList<EventNode> = LinkedList()
    ///
//    internal var updateQueue: [EventNode] = []
    
    internal var updateFrame: Bool = false

    internal var areUpdatesBlocked: Bool = false

    public func registerEvent() {
//        let node = self.events.append(EventNode(states: Set([])))
        updateFrame = true // set this to false in update()
    }
    
    public func observe(state: some Stateful) {
        self.states.insert(state.id)
    }
    public func blockUpdates() {
        areUpdatesBlocked = true
    }
    
    public func unblockUpdates() {
        areUpdatesBlocked = false
    }
    
    public func update() {
        if areUpdatesBlocked || states.isEmpty {
            return
        }
        
        blockUpdates()

        if updateFrame {
            // immediate updates
            SailboatGlobal.manager.update()
            states = []
        } else {
            // lazy render after api call?
            JSNode.requestAnimationFrame(JSClosure { _ in
                SailboatGlobal.manager.update()
                self.states = []
                return .undefined
            })
        }
        updateFrame = false
        unblockUpdates()

    }

}
