
// TODO: REMOVE THIS FILE?
//public protocol Attributable: CustomStringConvertible {
//
//    var name: String { get }
//    var value: String { get }
//
//}
//
//extension Array where Element: Attributable {
//
//    //TODO: I think this is not used, depricated
//    public var description: String {
//        // TODO: make this more efficient temporarily sorting all the keys before to ensure same rendering
////        let keysSorted = self.keys.sorted()
//        var output = ""
//        for attribute in self {
//            output += attribute.description
//        }
//
//        return output
//    }
//}
//
//extension Array where Element: Attributable {
//
//    public static func ==(lhs: Self, rhs: Self) -> Bool {
//        guard lhs.count == rhs.count else { return false }
//
//        for i in 0..<lhs.count {
//            if lhs[i].description != rhs[i].description {
//                return false
//            }
//        }
//
//        return true
//    }
//
//    public func eqauls(_ rhs: Self) -> Bool {
//        return self == rhs
//    }
//}
