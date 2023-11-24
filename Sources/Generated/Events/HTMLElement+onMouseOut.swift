import JavaScriptKit

extension HTMLElement {

    public func onMouseOut(_ completion: @escaping () -> Void) -> any Page {
        _ = self.element.addEventListener(
            "mouseout",
            JSClosure { event in
                completion()

                return .undefined
            }
        )

        return self
    }

}