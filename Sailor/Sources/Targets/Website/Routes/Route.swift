
//public struct Route {
//    let path: String
//    let page: any Page
//
//    public init(_ path: String, _ page: () -> any Page) {
//        self.path = path
//        self.page = page()
//    }
//}

import Sailboat

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
        
        // TODO: move from Router into another global thing or here and make it take in <MyRoute>
        if route == RouterUtils<MyRoute>.currentRoute() {
            self.children = builder().children
        } else {
            self.children = []
        }
    }
    

}

//public struct dRoute: Operator {
//    public var id: String = ""
//
//    public var children: [any Page]
//
//    public var body: some Page {
//        // TODO: new error
//        InternalError.recursingInPageBody(name: "route")
//        return self
//    }
//
//    public init(_ route: Int, @PageBuilder _ builder: @escaping () -> any Operator) {
//        self.children = builder().children
//    }
//
//}

