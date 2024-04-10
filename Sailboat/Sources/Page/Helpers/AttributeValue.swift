//
//  AttributeValue.swift
//  
//
//  Created by Joshua Davis on 2/1/24.
//

///Unit associated with attrubutes
public protocol AttributeValue: CustomStringConvertible, Equatable {
    var description: String { get }
}
