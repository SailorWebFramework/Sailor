//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/17/23.
//

import Foundation

public typealias Events = [String: Event]

public struct Event: CustomStringConvertible {
    public var description: String {
        "Event(name:\(name))"
    }
    /// name of the javascript event
    var name: String
    
    /// the swift action that results from the actual event listener
    var action: (EventResult) -> Void
    
    init(name: String, action: @escaping (EventResult) -> Void) {
        self.name = name
        self.action = action
    }
    
}
