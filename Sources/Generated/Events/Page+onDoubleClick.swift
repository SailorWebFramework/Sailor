// This file was autogenerated by Mustache. DO NOT CHANGE.

import JavaScriptKit

extension Page {

    public func onDoubleClick(_ completion: @escaping () -> Void) -> any Page {
        guard var copy = self as? any HTMLElement else {
            return Div { self }.onDoubleClick { 
                completion()
            }
        }

        copy.events["doubleclick"] = JSClosure { event in
            completion()

            return .undefined
        }

        return copy
    }

}