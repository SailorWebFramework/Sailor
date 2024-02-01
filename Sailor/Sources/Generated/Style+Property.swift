//
//  Style+Property.swift
//  
//
//  Created by Joshua Davis on 10/5/23.
//

extension Style {
    public enum Property: Hashable {
        case accentColor(Unit.Color),
             backgroundColor(Unit.Color),
             display(Unit.Display),
             width(Unit.Dimention),
             height(Unit.Dimention)
        
        public func hash(into hasher: inout Hasher) {
            hasher.combine(description)
        }
        
        public var description: String {
            "\(self.name):\(self.value)"
        }
        
        public var name: String {
            switch(self) {
            case .accentColor(_):
                return "accent-color"
            case .backgroundColor(_):
                return "background-color"
            case .display(_):
                return "display"
            case .width(_):
                return "width"
            case .height(_):
                return "height"
            }
        }
            
        public var value: String {
            switch(self) {
            case .accentColor(let color):
                return color.description
            case .backgroundColor(let color):
                return color.description
            case .display(let display):
                return display.description
            case .width(let dimention):
                return dimention.description
            case .height(let dimention):
                return dimention.description
            }
        }
    }
}


//protocol Property: Hashable, Comparable {
//    var name: String { get }
//    var value: any CSSValue { get }
//}
//
//extension Property {
//    public static func == (lhs: Property, rhs: Property) -> Bool {
//        lhs.hashValue == rhs.hashValue
//    }
//
//    public static func <(lhs: Property, rhs: Property) -> Bool {
//        lhs.name < rhs.name
//    }
//
//    public func hash(into hasher: inout Hasher) {
//        hasher.combine(name)
//        hasher.combine(value)
//    }
//
//}

//public extension Style {
//    struct Property: Hashable, Comparable {
//        public static func == (lhs: Property, rhs: Property) -> Bool {
//            lhs.hashValue == rhs.hashValue
//        }
//
//        public static func <(lhs: Property, rhs: Property) -> Bool {
//            lhs.name < rhs.name
//        }
//
//        public func hash(into hasher: inout Hasher) {
//            hasher.combine(name)
//            hasher.combine(value)
//        }
//
//        var name: String
//        var value: any CSSValue
//
//    }
//}
