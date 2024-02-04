import JavaScriptKit

public class Router {
    var curr_route: String? = nil

    public init() {
        self.curr_route = "/"
        setupRouteListener()
    }

    private func setupRouteListener() {
        JSObject.global.addEventListener!("popstate", JSClosure { _ in
            guard let route = JSObject.global.location.hash.string else {
                fatalError("route not found")
            }

            self.handleRouteChange(route: route)
            return .undefined
        })
    }

    func navigateTo(route: String) {
        JSObject.global.window.history.pushState(JSValue.string("yo"), JSValue.string("title"), route)
        self.handleRouteChange(route: route)
    }

    func handleRouteChange(route: String) {
        // Update UI based on the route change
        print("Route changed to: \(route)")
    }

    public func cleanPath(path: String) -> String {
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