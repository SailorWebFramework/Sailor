import JavaScriptKit

extension HTMLElement {

    public func onBlur(_ completion: @escaping () -> Void) -> any Page {
        _ = self.element.addEventListener(
            "blur",
            JSClosure { event in
                completion()

                return .undefined
            }
        )

        return self
    }

}