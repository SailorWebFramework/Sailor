//
//  File.swift
//  
//
//  Created by Joshua Davis on 2/12/24.
//

import Sailboat
import SailorShared
import JavaScriptKit

public final class WebEnvironment: SailorEnvironment {

    public var url: String {
        JSNode.window.location.object!.href.string!
    }
    
    public init() {
//        navigation = .init(
//            route: .defaultRoute,
//            assignRoute: { route in
//                let window = JSObject.global.window
//                let history = window.history.object!
//
//                // Define the new URL you want to navigate to
//                let newUrl = Self.buildRoute(route)
//
//                // Create an empty JavaScript object for the state
//                let stateObject = JSObject.global.Object.function!.new()
//
//                // Define the title (even though browsers currently ignore this parameter)
//                let title = JSValue.string("")
//
//                // Directly call `pushState` with the arguments
//                history.pushState?(stateObject, title, JSValue.string(newUrl))
//            }
//        )
    }
    
    //TODO: EDIT THIS
//    private static func buildRoute(_ route: MyRoutes) -> String {
//        
//        if route.description == "/" {
//            return "/"
//        }
//
//        return "/\(route.description)"
//    }
    
}
