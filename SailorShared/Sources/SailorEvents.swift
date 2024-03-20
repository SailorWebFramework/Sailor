//
//  SailorEvents.swift
//  
//
//  Created by Joshua Davis on 3/8/24.
//

import Sailboat

public final class SailorEvents {
    var elementID: ElementID
    var element: any Element {
        guard let element = SailboatGlobal.managedPages.elements[elementID] else {
            fatalError("SailorEvents: Element Doesnt Exist in Memory")
        }
        return element
    }
    
    var events: [String: (EventResult) -> Void] {
        element.events
    }
    
    public init(from elementID: ElementID) {
        self.elementID = elementID
    }
    
    private var makeEnvironmentObject: (EventResult) -> Void {
        self.dispatchBatchedEvent("_makeEnvironmentObject")
    }
    
    private var killEnvironmentObject: (EventResult) -> Void {
        self.dispatchBatchedEvent("_killEnvironmentObject")
    }
    
    private func dispatchBatchedEvent(_ name: String, completion: ((EventResult) -> Void)? = nil) -> (EventResult) -> Void {
        { eventResult in
            SailboatGlobal.manager.startEvent()
            self.events[name]?(eventResult)
            completion?(eventResult)
            SailboatGlobal.manager.endEvent()
        }
    }
}

//public typealias SailorEvents = [String: (EventResult) -> Void]

public extension SailorEvents {
    /// onAppear function with other initialization items
    var onAppear: (EventResult) -> Void {
        dispatchBatchedEvent("_appear") { eventResult in
            self.makeEnvironmentObject(eventResult)
        }
    }
    
    /// onAppear function with other initialization items
    var onDisappear: (EventResult) -> Void {
        dispatchBatchedEvent("_disappear") { eventResult in
            self.killEnvironmentObject(eventResult)
        }
    }
    
    var onUpdate: (EventResult) -> Void {
        self.dispatchBatchedEvent("_update")
    }
    
    var task: (EventResult) -> Void {
        self.events["_task"] ?? { _ in }
    }
}
