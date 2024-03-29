//
//  AttributeGroup.swift
//  
//
//  Created by Joshua Davis on 2/1/24.
//

//public protocol AttributeGroup: CustomStringConvertible, Equatable { // Comparable
//    var description: String { get }
//    var name: String { get }
//    var value: () -> String { get } // TODO: consider changing to any AttributeValue?
//    
//    init(name: String, value: @escaping () -> String)
//
//}

//public extension AttributeGroup {
//    static func ==(lhs: any AttributeGroup, rhs: any AttributeGroup) -> Bool {
//        return lhs.description == rhs.description
//    }
//    
//    var description: String {
//        "\(name):\(value)"
//    }
//
//}


public struct ElementAttributeGroup: CustomStringConvertible, Equatable  {
    public static func == (lhs: ElementAttributeGroup, rhs: ElementAttributeGroup) -> Bool {
        return lhs.description == rhs.description
    }

    public var description: String {
        "\(name):\(value().description)"
    }

    public var name: String
    public var value: () -> any AttributeValue
    public var override: Bool
    
    public init(name: String, value: @escaping () -> any AttributeValue) {
        self.name = name
        self.value = value
        self.override = true
    }
    public init(name: String, value: @escaping () -> any AttributeValue, override: Bool) {
        self.name = name
        self.value = value
        self.override = override
    }
}
