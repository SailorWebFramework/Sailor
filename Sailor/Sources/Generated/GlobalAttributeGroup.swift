//
//  Attribute.swift
//  
//
//  Created by Joshua Davis on 10/6/23.
//

import Sailboat

public protocol GlobalAttributeGroup: AttributeGroup { }

public extension GlobalAttributeGroup {
    
    static func style(_ style: Style) -> Self {
        .init(name: "style", value: style.description)
    }
    
}


//public enum Attribute { // AttributeGroup
//    case style(Style),
//         width(Int),
//         height(Int)
//    
//    public var description: String {
//        "\(self.name): \(self.value)"
//    }
//    
//    public var name: String {
//        switch self {
//        case .style(_):
//            return "style"
//        case .width(_):
//            return "width"
//        case .height(_):
//            return "height"
//        }
//    }
//    
//    public var value: String {
//        switch self {
//        case .style(let value):
//            return value.description
//        case .width(let value):
//            return value.description
//        case .height(let value):
//            return value.description
//        }
//    }
//}


//public enum GlobalAttribute: AttributeGroup {
//    case style(Style),
//         width(Int),
//         height(Int)
//
//    public var description: String {
//        "\(self.name): \(self.value)"
//    }
//
//    public var name: String {
//        switch self {
//        case .style(_):
//            return "style"
//        case .width(_):
//            return "width"
//        case .height(_):
//            return "height"
//        }
//    }
//
//    public var value: String {
//        switch self {
//        case .style(let value):
//            return value.description
//        case .width(let value):
//            return value.description
//        case .height(let value):
//            return value.description
//        }
//    }
//}
