//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/17/23.
//

import JavaScriptKit
import Sailboat

extension EventResult {

    static func getClosure(_ eventName: String, action: @escaping (EventResult) -> Void) -> JSClosure {
        JSClosure { event in

            guard let firstEvent = event.first else {
                // TODO error better
                print("EVENT UPDATE FAILED")
                return .undefined
            }
            
            let resultValue = Self.getResultValue(eventName, firstEvent)
            
            action(resultValue)

            return .undefined
        }
    }
    
    // TODO: return the values needed by which events as EventResults, nil if error?
    private static func getResultValue(_ eventName: String, _ eventJSValue: JSValue) -> EventResult {
        return resultMap[eventName]?(eventJSValue) ?? EventResult.none
    }
    
}
