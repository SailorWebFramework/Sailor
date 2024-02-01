//
//  AttributeValue.swift
//  
//
//  Created by Joshua Davis on 2/1/24.
//

// TODO: depricate this?

//public struct AttributeResult: Hashable, CustomStringConvertible, Equatable {
//    public let name: String
//    public let value: String
//    
//    public var description: String {
//        "\(name):\(value)"
//    }
//}
//

///Unit associated with attrubutes
public protocol AttributeValue: Hashable, CustomStringConvertible, Equatable {
    var description: String { get }
}

extension Int: AttributeValue { }

extension String: AttributeValue { }
