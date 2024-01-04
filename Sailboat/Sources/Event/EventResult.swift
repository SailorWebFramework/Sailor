//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/17/23.
//

public enum EventResult {
    case string(String),
         float(Double),
         bool(Bool),
         int(Int),
        // TODO: remove this, JSObject for old code to work
//         object(JSObject),
         none
    
}
