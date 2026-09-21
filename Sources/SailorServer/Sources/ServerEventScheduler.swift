//
//  ServerEventScheduler.swift
//
//  Created by Sailor Codegen.
//

import Sailboat

/// A no-op event scheduler for server-side rendering.
/// SSR is a single-pass render — no reactivity or state updates needed.
@MainActor
public final class ServerEventScheduler: EventScheduler {

    public var states: Set<StateID> = []

    public init() {}

    public func registerEvent() { }
    public func observe(state: some Stateful) { }
    public func blockUpdates() { }
    public func unblockUpdates() { }
    public func update() { }
}
