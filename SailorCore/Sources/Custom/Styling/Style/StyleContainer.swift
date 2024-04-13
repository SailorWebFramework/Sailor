//
//  StyleContainer.swift
//
//
//  Created by Joshua Davis on 10/3/23.
//

public protocol StyleContainer: Style, CustomStringConvertible {
    var properties: [any Style] { get set }
}

public extension StyleContainer {
//    static func == (lhs: Self, rhs: Self) -> Bool {
//        lhs.description == rhs.description
//    }
    var description: String {
        var output = ""
        for property in self.properties {
            output += property.description
        }
        
        return output
    }
    
    var style: Self {
        fatalError("style container has no body")
        return self
    }
}

public struct StyleGroup: StyleContainer {

    public var properties: [any Style]

    internal init(_ properties: [any Style]) {
        self.properties = properties
    }
    
    public init(@StyleBuilder _ style: () -> any StyleContainer) {
        self.properties = style().properties
    }

}
