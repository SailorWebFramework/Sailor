import JavaScriptKit

extension HTMLElement {

    public func onTouchStart(_ completion: @escaping (JSObject) -> Void) -> any Page {
        _ = self.element.addEventListener(
            "touchstart",
            JSClosure { event in
                guard let touches = event.first?.touches.object else {
                    return .undefined
                }
                completion(touches)

                return .undefined
            }
        )

        return self
    }

}