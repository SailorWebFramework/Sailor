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

    /// States observed while updates were blocked (e.g. from onAppear firing synchronously
    /// during an rAF reconcile). Tracked so we can flush them in a follow-up rAF.
    /// Design 006 Option 1.
    private var pendingStates: Set<StateID> = []

    public func registerEvent() {
//        let node = self.events.append(EventNode(states: Set([])))
        updateFrame = true // set this to false in update()
    }

    public func observe(state: some Stateful) {
        states.insert(state.id)
        // Track states observed while a rAF reconcile has blocked re-entrant updates.
        // These need a follow-up rAF to be flushed (Design 006 Option 1).
        if areUpdatesBlocked {
            pendingStates.insert(state.id)
        }
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
            // immediate updates (DOM events: onClick, onAppear, etc.)
            SailboatGlobal.manager.update()
            states = []
        } else {
            // lazy render after api call — Design 006 Option 1:
            // Block re-entrant updates during the rAF callback to prevent stale
            // managedPages.children snapshot corruption (Issue B).
            JSNode.requestAnimationFrame(JSClosure { _ in
                // Reset pending tracker before each reconcile pass.
                self.pendingStates = []
                self.blockUpdates()
                SailboatGlobal.manager.update()
                // Capture states observed during the blocked reconcile (e.g. from onAppear).
                // These have changed values that weren't reflected in the outer body() call.
                let pending = self.pendingStates
                self.states = []
                self.unblockUpdates()
                if !pending.isEmpty {
                    // Restore pending states and flush in a follow-up rAF.
                    // One extra frame (~16 ms) is imperceptible.
                    self.states = pending
                    JSNode.requestAnimationFrame(JSClosure { _ in
                        SailboatGlobal.manager.update()
                        self.states = []
                        return .undefined
                    })
                }
                return .undefined
            })
        }
        updateFrame = false
        unblockUpdates()

    }

}
