import JavaScriptKit
import Sailboat

public struct Router<MyRoutes: Routes>: Operator {
    public var children: [any Page]
    
    public var id: String
        
//    var curr_route: String? = nil
    
    public var body: some Page {
        fatalError("router doesnt have body")
        return self
    }
    
    // TODO: make this init work correctly
    public init(@RouteBuilder<MyRoutes> _ routes: @escaping () -> [Route<MyRoutes>], notFound: @escaping () -> any Page) {
//        self.curr_route = "/"
        
        self.children = []//routes.children
        self.id = ""
        
        let routes = routes()
        for route in routes {
            if route.isActive {
                self.children.append(route)
            }
        }
        
        if self.children.isEmpty {
            self.children.append(Route<MyRoutes>(.NotFound) { notFound() })
        }
//        Self.setupRouteListener()
    }
    
//    public init(@RouteBuilder<MyRoutes> _ routes: @escaping () -> [Route<MyRoutes>]) {
////        self.curr_route = "/"
//        
//        self.children = []//routes.children
//        self.id = ""
//        
//        // default to not found route if none of the routes trigger
//        var notFoundRoute: Route<MyRoutes>? = nil
//        
//        let routes = routes()
//        for route in routes {
//            if route.isActive {
//                self.children.append(route)
//            }
//            
//            if route.route == .NotFound {
//                notFoundRoute = route
//            }
//        }
//        
//        if let notFoundRoute = notFoundRoute, self.children.isEmpty {
//            self.children.append(notFoundRoute)
//        }
////        Self.setupRouteListener()
//    }
    
    
    
    
//    
//    static var url: String {
//        JSNode.window.location.object!.href.string!
//    }
//    
//    private static func setupRouteListener() {
//        JSObject.global.addEventListener!("popstate", JSClosure { _ in
//            guard let route = JSObject.global.location.hash.string else {
//                fatalError("route not found")
//            }
//
//            self.handleRouteChange(route: route)
//            return .undefined
//        })
//    }
//
////    static func navigateTo(route: String) {
////        JSObject.global.window.history.pushState(JSValue.string("yo"), JSValue.string("title"), route)
////        self.handleRouteChange(route: route)
////    }
//
//    static func handleRouteChange(route: String) {
//        // Update UI based on the route change
//        print("Route changed to: \(route)")
//    }
    
}
