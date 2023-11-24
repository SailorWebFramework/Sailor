import JavaScriptKit

extension HTMLElement {

    public func onDragStart(_ completion: @escaping (JSObject) -> Void) -> any Page {
        _ = self.element.addEventListener(
            "dragstart",
            JSClosure { event in
                guard let dataTransfer = event.first?.dataTransfer.object else {
                    return .undefined
                }
                completion(dataTransfer)

                return .undefined
            }
        )

        return self
    }

}