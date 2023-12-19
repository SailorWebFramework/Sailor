// This file was autogenerated by Mustache. DO NOT CHANGE.

import JavaScriptKit

extension Page {

    public func onDrop(_ completion: @escaping (JSObject) -> Void) -> any Page {
        guard var copy = self as? any HTMLElement else {
            return Div { self }.onDrop { value in
                completion(value)
            }
        }
        copy.events["drop"] = Event(
            name: "drop", 
            build: { eventResult in
                if case let EventResult.object(value) = eventResult {
                    completion(value)
                }
            }
        )

        return copy
    }

}