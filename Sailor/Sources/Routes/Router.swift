import JavaScriptKit

protocol RouterDelegate: AnyObject {
    func handleRouteChange(route: String)
}

public class Router {
    weak var delegate: RouterDelegate?

    public init() {
        setupRouteListener()
    }

    private func setupRouteListener() {
        JSObject.global.addEventListener!("popstate", JSClosure { _ in
            guard let route = JSObject.global.location.hash.string else {
                fatalError("route not found")
            }

            self.delegate?.handleRouteChange(route: route)
            return .undefined
        })
    }

    func navigateTo(route: String) {
        JSObject.global.window.history.pushState(JSValue.string("yo"), JSValue.string("title"), route)
        delegate?.handleRouteChange(route: route)
    }
}