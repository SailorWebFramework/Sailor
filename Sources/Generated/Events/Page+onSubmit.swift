// This file was autogenerated by Mustache. DO NOT CHANGE.

import JavaScriptKit

extension Page {

    public func onSubmit(_ completion: @escaping () -> Void) -> any Page {
        guard var copy = self as? any HTMLElement else {
            return Div { self }.onSubmit { 
                completion()
            }
        }

        copy.events["submit"] = JSClosure { event in
            completion()

            return .undefined
        }

        return copy
    }

}