

public typealias Attributes = [Attribute: any AttributeValue]

extension Attributes: CustomStringConvertible {

    //TODO: I think this is not used, depricated
    public var description: String {
        // TODO: make this more efficient temporarily sorting all the keys before to ensure same rendering
        let keysSorted = self.keys.sorted()
        var output = ""
        for key in keysSorted {
            if let value = self[key] {
                output += "\(key.description)=\"\(value.description)\""
            }
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
    
    public func eqauls(_ rhs: Attributes) -> Bool {
        guard self.count == rhs.count else { return false }

        for (key, lhsValue) in self {
            guard let rhsValue = rhs[key] else { return false }

            if lhsValue.description != rhsValue.description {
                return false
            }
        }

        return true
    }
}
