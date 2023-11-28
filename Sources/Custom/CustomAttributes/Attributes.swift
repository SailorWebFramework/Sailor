

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

extension Attributes: Equatable { 

    public static func ==(lhs: Attributes, rhs: Attributes) -> Bool {
        guard lhs.count == rhs.count else { return false }

        for (key, lhsValue) in lhs {
            guard let rhsValue = rhs[key] else { return false }

            if lhsValue.description != rhsValue.description {
                return false
            }
        }

        return true
    }
}

// extension Attributes: Equatable {
//     public static func ==(lhs: Attributes, rhs: Attributes) -> Bool {
//         guard lhs.count == rhs.count else { return false }

//         for (key, lhsValue) in lhs {
//             guard let rhsValue = rhs[key] else { return false }

//             // Check if both values are of the same type and compare them
//             if lhsValue != rhsValue {
//                 return false
//             }
//         }

//         return true
//     }
// }