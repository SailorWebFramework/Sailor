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
        self.children = []//routes.children
        self.id = ""
        
        let routes = routes()
        for route in routes {
            if route.isActive {
                self.children.append(route)
            }
        }
        
        if self.children.isEmpty {
            // TODO: would be nice to have a Route Operator for consistency
//            self.children.append(Route<MyRoutes>(.NotFound) { notFound() })
            self.children.append(notFound())
        }
    }
    
    
}
