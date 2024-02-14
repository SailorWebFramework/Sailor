
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
    
    public var body: some Page {
        // TODO: new error
        fatalError("route")
//        InternalError.recursingInPageBody(name: "route")
        return self
    }
    
    let path: String

    public init(_ path: MyRoute, @PageBuilder _ builder: @escaping () -> any Operator) {
        self.id = ""
        self.path = path.description
        
        // TODO: move from Router into another global thing or here and make it take in <MyRoute>
        if RouterUtils.parseAndVerify(path: path.description) {
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

