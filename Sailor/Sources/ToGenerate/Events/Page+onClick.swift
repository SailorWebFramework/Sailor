// This file was autogenerated by Mustache. DO NOT CHANGE.
import Sailboat

extension Element {
    // TODO: make all events like this
    public func onClick(_ completion: @escaping () -> Void) -> Self {
        withEvent(name: "click") { _ in
            completion()
        }
    }

}
