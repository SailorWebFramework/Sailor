// This file was autogenerated by Mustache. DO NOT CHANGE.
import Sailboat

extension Element {
    public func onBlur(_ completion: @escaping () -> Void) -> Self {
        var copy = self

        copy.events["blur"] = { _ in
            completion()
        }

        return copy
    }
}
