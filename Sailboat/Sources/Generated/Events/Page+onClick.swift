// This file was autogenerated by Mustache. DO NOT CHANGE.

extension HTMLElement {

    public func onClick(_ completion: @escaping () -> Void) -> Self {
        var copy = self

        copy.events["click"] = Event(name: "click", action: { _ in
            completion()
        })

        return copy
    }

}