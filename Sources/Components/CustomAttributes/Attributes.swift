

import JavaScriptKit

public typealias Attributes = [Attribute: any AttributeValue]

extension Attributes {
    func render() -> String {
        var output = ""
        for (k, v) in self {
            output += "\(k.description)=\"\(v.description)\""
        }
        return output
    }
}