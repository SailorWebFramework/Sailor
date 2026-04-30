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
        properties.map { $0.description }.joined()
    }
    
    @_spi(Private)
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
