// This file was autogenerated by Mustache. DO NOT CHANGE.

import JavaScriptKit

extension Page {

    public func onFocus(_ completion: @escaping () -> Void) -> any Page {
        guard var copy = self as? any HTMLElement else {
            return Div { self }.onFocus { 
                completion()
            }
        }
        copy.events["focus"] = Event(name: "focus", build: { _ in
            completion()
        })

        return copy
    }

}