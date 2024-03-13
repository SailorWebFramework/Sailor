
import Sailboat
import SailorShared

public struct Route<MyRoute: Routes>: Operator {
    public var children: [any Page]
    
    public var id: String
    
    public var isActive: Bool {
        !children.isEmpty
    }
    
    public var body: some Page {
        // TODO: new error
        fatalError("route")
//        InternalError.recursingInPageBody(name: "route")
        return self
    }
    
    let route: MyRoute

    public init(_ route: MyRoute, @PageBuilder _ builder: @escaping () -> any Operator) {
        self.id = ""
        self.route = route
        
        // TODO: move to @Environment
        if route == RouterUtils<MyRoute>.currentRoute() {
            print("ROUTE IS \(route), \(RouterUtils<MyRoute>.currentRoute())")
            self.children = builder().children
        } else {
            self.children = []
        }
    }
    

}


