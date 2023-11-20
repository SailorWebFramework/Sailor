//
//  File.swift
//  
//
//  Created by Joshua Davis on 10/3/23.
//

import Foundation
import JavaScriptKit

public typealias Attributes = [Attribute: any AttributeValue]

extension Attributes {
    func render() -> String {
        var output = ""
        for (k, v) in self {
            output += "\(k.description)=\"\(v.description)\""
        }
        return output
    }
}

// TODO: consider renaming to View to be more similar to swiftUI?
public protocol Page: Hashable, CustomStringConvertible {
    associatedtype Body: Page

    var body: Body { get }
    var attributes: Attributes { get set }
    
    func build(parent: JSValue)
    // func render(id: String?) -> String

}

extension Page {
    public var description: String { body.description }
    
    // public func render(id: String? = nil) -> String {
    //     return body.render(id: id)
    // }
    
    public func build(parent: JSValue) {
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
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(body)
        for (key, value) in attributes {
            hasher.combine(key)
            hasher.combine(value)
        }
    }
}


