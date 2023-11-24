import JavaScriptKit

extension HTMLElement {

    public func onKeyDown(_ completion: @escaping (String) -> Void) -> any Page {
        _ = self.element.addEventListener(
            "keydown",
            JSClosure { event in
                guard let key = event.first?.key.string else {
                    return .undefined
                }
                completion(key)

                return .undefined
            }
        )

        return self
    }

}