//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/17/23.
//

public typealias Events = [String: (EventResult) -> Void]

public enum EventResult {
    case string(String),
         float(Double),
         bool(Bool),
         int(Int),
         none
}
