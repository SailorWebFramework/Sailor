// This file was autogenerated by Mustache. DO NOT CHANGE.

import JavaScriptKit

extension Page {

    public func onMouseOut(_ completion: @escaping () -> Void) -> any Page {
        guard var copy = self as? any HTMLElement else {
            return Div { self }.onMouseOut { 
                completion()
            }
        }
        copy.events["mouseout"] = Event(name: "mouseout", build: { _ in
            completion()
        })

        return copy
    }

}