//
//  ManagedStates.swift
//
//
//  Created by Joshua Davis on 4/22/24.
//

class ManagedStates {
    static var globalID: StateID = 0
    
    static func registerID() -> StateID {
        globalID += 1
        return globalID
    }
}
