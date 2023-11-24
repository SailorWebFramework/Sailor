import JavaScriptKit

extension HTMLElement {

    public func onMouseOver(_ completion: @escaping () -> Void) -> any Page {
        _ = self.element.addEventListener(
            "mouseover",
            JSClosure { event in
                completion()

                return .undefined
            }
        )

        return self
    }

}