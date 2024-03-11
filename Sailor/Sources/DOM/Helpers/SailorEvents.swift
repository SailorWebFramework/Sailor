//
//  SailorEvents.swift
//  
//
//  Created by Joshua Davis on 3/8/24.
//

import Sailboat

typealias SailorEvents = [String: (EventResult) -> Void]

public extension SailorEvents {
    
    /// onAppear function with other initialization items
    var onAppear: (EventResult) -> Void {
        dispatchBatchedEvent("_appear") { eventResult in
            makeEnvironmentObject(eventResult)
        }
    }
    
    /// onAppear function with other initialization items
    var onDisappear: (EventResult) -> Void {
        dispatchBatchedEvent("_disappear") { eventResult in
            killEnvironmentObject(eventResult)
        }
    }
    
    var onUpdate: (EventResult) -> Void {
        dispatchBatchedEvent("_update")
    }
    
    var task: (EventResult) -> Void {
        self["_task"] ?? { _ in }
    }
    
    var makeEnvironmentObject: (EventResult) -> Void {
        dispatchBatchedEvent("_makeEnvironmentObject")
    }
    
    var killEnvironmentObject: (EventResult) -> Void {
        dispatchBatchedEvent("_killEnvironmentObject")
    }
    
    private func dispatchBatchedEvent(_ name: String, completion: ((EventResult) -> Void)? = nil) -> (EventResult) -> Void {
        { eventResult in
            SailboatGlobal.manager.startEvent()
            self[name]?(eventResult)
            completion?(eventResult)
            SailboatGlobal.manager.endEvent()
        }
    }
}
