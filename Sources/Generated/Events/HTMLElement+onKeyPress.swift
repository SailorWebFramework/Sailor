// This file was autogenerated by Mustache. DO NOT CHANGE.

import JavaScriptKit

extension HTMLElement {

    public func onKeyPress(_ completion: @escaping (String) -> Void) -> any Page {
        _ = self.element.addEventListener(
            "keypress",
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