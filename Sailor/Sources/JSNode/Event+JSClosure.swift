//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/17/23.
//

import JavaScriptKit
import Sailboat

extension EventResult {
    
    // TODO: return the values needed by which events as EventResults, nil if error?
    static func getResultValue(_ eventName: String, _ eventJSValue: JSValue) -> EventResult {
        
        //TODO: make event map
        
//        print("GETTING RESULT VALUE", self.name, eventJSValue.target.value.string)
        if eventName == "input",
           let inputValue = eventJSValue.target.value.string {
            return EventResult.string(inputValue)
        }

        return EventResult.none
    }
    
    static func getClosure(_ eventName: String, action: @escaping (EventResult) -> Void) -> JSClosure {
        JSClosure { event in

            guard let firstEvent = event.first else {
                // TODO error better
                print("EVENT UPDATE FAILED")
                return .undefined
            }
            
            let resultValue = self.getResultValue(eventName, firstEvent)
            
            action(resultValue)

            return .undefined
        }
    }
    
    
}
