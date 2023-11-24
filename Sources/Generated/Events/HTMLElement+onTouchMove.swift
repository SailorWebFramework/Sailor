import JavaScriptKit

extension HTMLElement {

    public func onTouchMove(_ completion: @escaping (JSObject) -> Void) -> any Page {
        _ = self.element.addEventListener(
            "touchmove",
            JSClosure { event in
                guard let changedTouches = event.first?.changedTouches.object else {
                    return .undefined
                }
                completion(changedTouches)

                return .undefined
            }
        )

        return self
    }

}