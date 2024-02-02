//
//  AttributeGroup.swift
//  
//
//  Created by Joshua Davis on 2/1/24.
//

public protocol AttributeGroup: CustomStringConvertible, Equatable { // Comparable
    var description: String { get }
    var name: String { get }
    var value: String { get } // TODO: consider changing to any AttributeValue?
    
    init(name: String, value: String)

}

public extension AttributeGroup {
    static func ==(lhs: any AttributeGroup, rhs: any AttributeGroup) -> Bool {
        return lhs.description == rhs.description
    }
    
    var description: String {
        "\(name):\(value)"
    }

}
