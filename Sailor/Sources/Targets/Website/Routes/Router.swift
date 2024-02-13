import JavaScriptKit
import Sailboat

public struct Router: Operator {
    public var children: [any Page]
    
    public var id: String
        
//    var curr_route: String? = nil
    
    public var body: some Page {
        fatalError("router doesnt have body")
        return self
    }
    
    public init(@RouteBuilder _ routes: @escaping () -> any Operator) {
//        self.curr_route = "/"
        self.children = routes().children
        self.id = ""
        Self.setupRouteListener()
    }
    
    static var url: String {
        JSNode.window.location.object!.href.string!
    }
    
    public static func parseAndVerify(path: String) -> Bool {
//        if path == "/" {
//            return cleanPath(path: url)
//        }
        return cleanPath(path: url) == path
    }

    private static func setupRouteListener() {
        JSObject.global.addEventListener!("popstate", JSClosure { _ in
            guard let route = JSObject.global.location.hash.string else {
                fatalError("route not found")
            }

            self.handleRouteChange(route: route)
            return .undefined
        })
    }

    static func navigateTo(route: String) {
        JSObject.global.window.history.pushState(JSValue.string("yo"), JSValue.string("title"), route)
        self.handleRouteChange(route: route)
    }

    static func handleRouteChange(route: String) {
        // Update UI based on the route change
        print("Route changed to: \(route)")
    }
    
//    public static func cleanPath(path: String) -> String {
//        let tmp = path.split(separator: "/")
//        // print("tmp: \(tmp)")
//        // remove "http:" and "localhost:8080" from the path
//        let cleaned = tmp.dropFirst(2).joined(separator: "")
//        if cleaned == "" {
//            return "/"
//        }
//        return cleaned
//        //url.replacingOccurrences(of: "http://localhost:8080", with: "")
//    }

    public static func cleanPath(path: String) -> String {
        let tmp = path.split(separator: "/")
        // print("tmp: \(tmp)")
        // remove "http:" and "localhost:8080" from the path
        let cleaned = tmp.dropFirst(2).joined(separator: "")
        if cleaned == "" {
            return "/"
        }
        return cleaned
        //url.replacingOccurrences(of: "http://localhost:8080", with: "")
    }
}
