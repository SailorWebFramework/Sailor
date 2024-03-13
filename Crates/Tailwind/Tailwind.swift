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
//            print("doing description")
            output += value.description + " "
//            print("fin description")
        }
        return attribute(ElementAttributeGroup(name: "class", value: output), override: false)
    }
}
