// This file was autogenerated by Mustache. DO NOT CHANGE.
import Sailboat

extension Element {

    public func onMouseOut(_ completion: @escaping () -> Void) -> Self {
        var copy = self

        copy.events["mouseout"] = { _ in
            completion()
        }

        return copy
    }

}
