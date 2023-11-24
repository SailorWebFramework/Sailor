import JavaScriptKit

extension HTMLElement {

    public func onDoubleClick(_ completion: @escaping () -> Void) -> any Page {
        _ = self.element.addEventListener(
            "doubleclick",
            JSClosure { event in
                completion()

                return .undefined
            }
        )

        return self
    }

}