//
//  Tailwind.swift
//  
//
//  Created by Joshua Davis on 1/31/24.
//

import Sailboat

//public extension GlobalAttributeGroup {
//    
//    ///Defines a collection of tailwind styling classes
//    static func wind(_ values: TailwindClass...) -> Self {
//        var output = ""
//        for value in values {
//            output += value.description + " "
//        }
//        return .init(name: "class", value: output)
//    }
//}

public extension Element {
    ///Defines a collection of tailwind styling classes
    func wind(_ values: TailwindClass...) -> Self {
        var output = ""
        for value in values {
            output += value.description + " "
        }
        return attribute(ElementAttributeGroup(name: "class", value: output), override: false)
    }
}

///One
// TODO: FUTURE Create tailwind based styling
public enum TailwindClass: CustomStringConvertible {
    /// .m-0 { margin: 0; }
    case m0
    
    ///
    case mx0
    /// .p-10 { padding: 2.5rem; }
    case p10
    ///
    case bgSlate100
    
    public var description: String {
        switch self {
        case .m0:
            return "m-0"
        case .mx0:
            return "mx-0"
        case .bgSlate100:
            return "bg-slate-100"
        case .p10:
            return "p-10"
        }
    }
    
}
