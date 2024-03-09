//
//  SailorEvents.swift
//  
//
//  Created by Joshua Davis on 3/8/24.
//

import Sailboat

typealias SailorEvents = [String: (EventResult) -> Void]

public extension SailorEvents {
    var onAppear: (EventResult) -> Void {
        self["_appear"] ?? { _ in }
    }
    
    var onDisappear: (EventResult) -> Void {
        self["_disappear"] ?? { _ in }
    }
    
    var onUpdate: (EventResult) -> Void {
        self["_update"] ?? { _ in }
    }
    
    var task: (EventResult) -> Void {
        self["_task"] ?? { _ in }
    }
}

//
//struct SailorEvents {
//    var onAppear: () -> Void
//    var onDisappear: () -> Void
//    var onUpdate: () -> Void
//
//    static let names = Set(["_appear", "_disappear", "_update"])
//
//    init() {
//        self.onAppear = {}
//        self.onDisappear = {}
//        self.onUpdate = {}
//    }
//}
