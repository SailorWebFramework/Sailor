import JavaScriptKit

extension HTMLElement {

    public func onClick(_ completion: @escaping () -> Void) -> any Page {
        _ = self.element.addEventListener(
            "click",
            JSClosure { event in
                completion()

                return .undefined
            }
        )

        return self
    }

}