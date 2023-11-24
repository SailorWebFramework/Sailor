import JavaScriptKit

extension HTMLElement {

    public func onSubmit(_ completion: @escaping () -> Void) -> any Page {
        _ = self.element.addEventListener(
            "submit",
            JSClosure { event in
                completion()

                return .undefined
            }
        )

        return self
    }

}