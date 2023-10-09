//
//  File.swift
//  
//
//  Created by Joshua Davis on 10/6/23.
//

import Foundation
import JavaScriptKit


typealias BatchedEvents = [String: Event.Value]

struct Event {
    enum Value {
        case int(Int)
        case double(Double)
        case string(String)
    }

    let ID: String
    let value: Value
}

final class App {
    static var idIndex: UInt64 = 0

    static var cssStyles: [String:Style] = [:]
    
    static var pageHierarchy: PageHierarchy? = nil
    
    /// the global values of all the states in application
    static var states: [Any] = []
    
    /// global state accessable from any element must be unique type
    static var environment: [Any] = []

    static var builtDOM: any Page = Div()
    static var virtualDOM: any Page {
        pageHierarchy?.root ?? builtDOM
    }
    
    static func set(_ pageHierarchy: PageHierarchy) {
        Self.pageHierarchy = pageHierarchy
    }
    
    
    // TODO: Recieve Batched events from Javascript
//    @_silgen_name("send")
    static func recieve(_ event: Event) {
//        var changedStates = [Int]()
//
//        var components = elementID.split(separator: "|")
//
//        if components.count == 2 {
//            let statesIndexes = components[0].split(separator: ",")
//            let pageID = components[1]
//
//            // TODO:
//            for index in statesIndexes {
////                Self.states[index]
//            }
//        }
    }
    
    /*
     elementID: organized
     
     state indicies (comma seperated) + "|" + pagename/parsed
     0,1,2,3|asdfd
    */
    
    // TODO: update the view if the DOM changed
    @_silgen_name("update")
    static func update<Value>(elementID: String, value: Value) -> Bool {
        // update values


        // check if dom must be updated
        if builtDOM == virtualDOM { return false }
        
        // update js dom
//        for i in changedStates {
//            for page in states[i] {
//                
//            }
//        }
        
        
        return true
    }
    
    
    static func build(loc: URL) {
        // build pages
        pageHierarchy?.build(loc: loc)
        
        // build css files
    }

}
