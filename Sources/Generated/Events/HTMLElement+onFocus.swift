import JavaScriptKit

extension HTMLElement {

    public func onFocus(_ completion: @escaping () -> Void) -> any Page {
        _ = self.element.addEventListener(
            "focus",
            JSClosure { event in
                completion()

                return .undefined
            }
        )

        return self
    }

}