//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/17/23.
//

// TODO: remove this alias its confusing
public typealias Events = [String: (EventResult) -> Void]

public enum EventResult {
    case string(String),
         float(Double),
         bool(Bool),
         int(Int),
         none // TODO: rename to empty to not conflict with optional
}

//public enum EventResultTypes {
//    case string,
//         float,
//         bool,
//         int,
//         empty
//}
