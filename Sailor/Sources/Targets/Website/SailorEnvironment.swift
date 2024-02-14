//
//  File.swift
//  
//
//  Created by Joshua Davis on 2/12/24.
//

import Sailboat
import JavaScriptKit

//public class Navigation<MyRoutes: Routes>: Sailboat.Navigation<MyRoutes> {
//
////    var route: MyRoutes?
////
////    init() {
////        self.route = nil
////    }
////    init(route: MyRoutes) {
////        self.route = route
////    }
//
//    private static func buildRoute(route: MyRoutes) -> String {
//        if route.description == "/" {
//            return "/"
//        }
//
//        return "/\(route)"
//    }
//
////    MyRoute
//    open override func go(to route: MyRoutes) {
////        self.route = route
//        //
//        let window = JSObject.global.window
//        let history = window.history.object!
//
//        // Define the new URL you want to navigate to
//        let newUrl = Self.buildRoute(route: route)
//
//        // Create an empty JavaScript object for the state
//        let stateObject = JSObject.global.Object.function!.new()
//
//        // Define the title (even though browsers currently ignore this parameter)
//        let title = JSValue.string("")
//
//        // Directly call `pushState` with the arguments
//        history.pushState?(stateObject, title, JSValue.string(newUrl))
//
////        SailorGlobal.manager.update()
//
//        super.go(to: route)
//    }
//}

public struct SailorEnvironment<MyRoutes: Routes>: SomeEnvironment {
    public var navigation: Sailboat.Navigation<MyRoutes>
    
    public typealias EnvRoutes = MyRoutes
    
    private static func buildRoute(_ route: MyRoutes) -> String {
        if route.description == "/" {
            return "/"
        }

        return "/\(route.description)"
    }
    
    public init() {
        navigation = .init(
            route: .getRoot,
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
}
