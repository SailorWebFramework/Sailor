//
//  EventResult+JSClosure.swift
//  
//
//  Created by Joshua Davis on 12/17/23.
//

import JavaScriptKit
import Sailboat

extension EventResult {

    @MainActor static func getClosure(_ eventName: String, preventDefault: Bool = false, action: @escaping (EventResult) -> Void) -> JSClosure {
        JSClosure { event in
            SailboatGlobal.manager.eventScheduler.registerEvent()

            guard let firstEvent = event.first else {
                // TODO: error better
                fatalError("EVENT UPDATE FAILED")
                return .undefined
            }

            if preventDefault {
                _ = firstEvent.preventDefault()
            }

            let resultValue = Self.getResultValue(eventName, firstEvent)


            action(resultValue)

            SailboatGlobal.manager.eventScheduler.update()

            return .undefined
        }
    }
    
    // TODO: return the values needed by which events as EventResults, nil if error?
    private static func getResultValue(_ eventName: String, _ eventJSValue: JSValue) -> EventResult {
        return resultMap[eventName]?(eventJSValue) ?? EventResult.none
    }
    
}
