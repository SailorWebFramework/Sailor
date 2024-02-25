//
//  File.swift
//  
//
//  Created by Joshua Davis on 2/12/24.
//

import Sailboat
import JavaScriptKit

// TODO: rename to WebEnvironment
public final class WebEnvironment<MyRoutes: Routes>: SomeEnvironment {
    public var data: [String: String] = [:]
    public var stack: [[WebData]] = []
    
    // TODO: make it so if you are in the same context add can be called twice
    public func add(_ data: WebData...) {
        stack.append(data)
    }
    
    public func favicon(_ path: String) {
        data["favicon"] = path
    }
    
    public func pop() {
        _ = stack.popLast()
    }
    
    public var navigation: Sailboat.Navigation<MyRoutes>
    
    public var url: String {
        JSNode.window.location.object!.href.string!
    }
    
    public init() {
        navigation = .init(
            route: .Root,
            assignRoute: { route in
                let window = JSObject.global.window
                let history = window.history.object!

                // Define the new URL you want to navigate to
                let newUrl = Self.buildRoute(route)

                // Create an empty JavaScript object for the state
                let stateObject = JSObject.global.Object.function!.new()

                // Define the title (even though browsers currently ignore this parameter)
                let title = JSValue.string("")

                // Directly call `pushState` with the arguments
                history.pushState?(stateObject, title, JSValue.string(newUrl))
            }
        )
    }
    
    //TODO: EDIT THIS
    private static func buildRoute(_ route: MyRoutes) -> String {
        
        if route.description == "/" {
            return "/"
        }

        return "/\(route.description)"
    }
    
}
