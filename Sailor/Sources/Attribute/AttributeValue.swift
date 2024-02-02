//
//  AttributeValue.swift
//  
//
//  Created by Joshua Davis on 2/1/24.
//

// TODO: remove this?

///Unit associated with attrubutes
public protocol AttributeValue: Hashable, CustomStringConvertible, Equatable {
    var description: String { get }
}

extension Int: AttributeValue { }

extension String: AttributeValue { }
