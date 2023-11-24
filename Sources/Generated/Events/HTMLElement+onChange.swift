import JavaScriptKit

extension HTMLElement {

    public func onChange(_ completion: @escaping (String) -> Void) -> any Page {
        _ = self.element.addEventListener(
            "change",
            JSClosure { event in
                guard let value = event.first?.value.string else {
                    return .undefined
                }
                completion(value)

                return .undefined
            }
        )

        return self
    }

}