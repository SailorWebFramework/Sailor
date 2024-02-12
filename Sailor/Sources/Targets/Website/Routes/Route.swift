
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

public struct Route: Operator {
    public var children: [any Page]
    
    public var id: String
    
    public var body: some Page {
        // TODO: new error
        fatalError("route")
//        InternalError.recursingInPageBody(name: "route")
        return self
    }
    
    let path: String

    public init(_ path: String, @PageBuilder _ builder: @escaping () -> any Operator) {
        self.id = ""
        self.path = path
        
        if Router.parseAndVerify(path: path) {
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

