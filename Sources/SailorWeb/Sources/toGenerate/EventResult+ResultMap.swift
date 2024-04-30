//
//  EventResult+ResultMap.swift
//  
//
//  Created by Joshua Davis on 2/2/24.
//

import JavaScriptKit
import Sailboat

extension EventResult {
    
    //TODO: fix force unwrapping?
    static var resultMap: [String: (JSValue) -> EventResult] {
        [
            "input:value": { EventResult.string($0.target.value.string!) },
            "input:checked": { EventResult.bool($0.target.checked.boolean!) },
        ]
    }
    
}
