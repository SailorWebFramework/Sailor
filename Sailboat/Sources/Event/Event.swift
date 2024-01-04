//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/17/23.
//

public typealias Events = [String: Event]

// TODO: remove event and just use [String: (EventResult) -> Void]
public struct Event: CustomStringConvertible {
    
    public var description: String {
        "Event(name:\(name))"
    }
    /// name of the javascript event
    public var name: String
    
    /// the swift action that results from the actual event listener
    public var action: (EventResult) -> Void
    
    init(name: String, action: @escaping (EventResult) -> Void) {
        self.name = name
        self.action = action
    }
    
}
