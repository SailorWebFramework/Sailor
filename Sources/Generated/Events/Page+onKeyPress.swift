// This file was autogenerated by Mustache. DO NOT CHANGE.

import JavaScriptKit

extension Page {

    public func onKeyPress(_ completion: @escaping (String) -> Void) -> any Page {
        guard var copy = self as? any HTMLElement else {
            return Div { self }.onKeyPress { value in
                completion(value)
            }
        }

        copy.events["keypress"] = JSClosure { event in
            guard let key = event.first?.key.string else {
                return .undefined
            }
            completion(key)

            return .undefined
        }

        return copy
    }

}