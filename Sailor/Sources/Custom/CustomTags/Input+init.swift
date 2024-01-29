//
//  File.swift
//  
//
//  Created by Joshua Davis on 11/23/23.
//

//import JavaScriptKit

//extension Input {
//
//    // TODO: FIX event Binding/State doesnt update the event only the other way around/\.
//    // CREATE GLOBAL EVENTS THAT WHEN STATE CHANGES UPDATES VALUES ACROSS APP
//    public init(_ input: Binding<String>) {
//        self.init()
//
//        // TODO: value doesnt need to update every state change? every reload this changes
//        // Store initial values globally
//
////        if self.attributes[.value] == nil {
//        self.attributes[.value] = input.get()
////        }
//
////        self.events["input"] = Event(
////            name: "input",
////            action: { eventResult in
////                guard case let .string(value) = eventResult else {
////                    return
////                }
////
////                input.set(value)
////
////            }
////        )
//
//        self.events["input"] = { eventResult in
//            guard case let .string(value) = eventResult else {
//                return
//            }
//
//            input.set(value)
//
//        }
//
//    
//    }
//}

