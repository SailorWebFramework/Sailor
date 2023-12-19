//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/17/23.
//

import Foundation

public typealias Events = [String: Event]

// TODO: should i just use event name
public struct Event {
    
    /// name of the javascript event
    var name: String
    
    /// the function to update this event when the state changed
//    var update: (any EventResult) -> Void
    
    // TODO: rename to like action
    /// the function to build the actual event listener 
    var build: (EventResult) -> Void
    
    /// index to the state the event relies on, if any
    var stateIndex: Int? = nil
    
}



