//
//  File.swift
//  
//
//  Created by Joshua Davis on 10/3/23.
//

import Foundation
import SwiftSoup

public typealias Attributes = [Attribute: any AttributeValue]

public protocol Page: Hashable, CustomStringConvertible {
    associatedtype Body: Page

    var body: Body { get }
    var attributes: Attributes { get set }
    
    func build(parent: Element?)

}

extension Page {
    public var description: String { body.description }
    
    public func build(parent: Element? = nil) {
        body.build(parent: parent)
    }
    
    public func attribute(_ type: Attribute, value: some AttributeValue) -> Self {
        var copy = self
        copy.attributes[type] = value
        return copy
    }
}

public func ==(lhs: any Page, rhs: any Page) -> Bool {
    lhs.hashValue == rhs.hashValue
}

//MARK- Equatable, Hashable
extension Page {
    public static func ==(lhs: Self, rhs: Self) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
    
//    public static func ==(lhs: Self, rhs: any Page) -> Bool {
//        lhs.hashValue == rhs.hashValue
//    }
//    
//    public static func ==(lhs: any Page, rhs: Self) -> Bool {
//        lhs.hashValue == rhs.hashValue
//    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(body)
        for (key, value) in attributes {
            hasher.combine(key)
            hasher.combine(value)
        }
    }
}

