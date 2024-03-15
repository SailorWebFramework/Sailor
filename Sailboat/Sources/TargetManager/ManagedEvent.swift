//
//  ManagedEvent.swift
//
//
//  Created by Joshua Davis on 3/14/24.
//

public final class ManagedEvent {
    // TODO: make helper function, managedEvent.semaUp() and down
    /// decides if a state change triggers an update, waits for all events to complete before and batches updating
    public var semaphore: Int = 0
    /// the states changed in the current managed event
    public var states: Set<StateID> = []
    
}
