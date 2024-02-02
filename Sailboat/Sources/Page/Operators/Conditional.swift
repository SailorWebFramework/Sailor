//
//  List.swift
//
//
//  Created by Joshua Davis on 10/12/23.
//

public struct Conditional: Operator {
    // TODO: make this ID field unique?
    public var id: String = ""

    public var children: [any Page]

    public var body: some Page {
        // TODO: new error
        InternalError.recursingInPageBody(name: "conditional")
        return self
    }
    
    public init() {
        self.init([])
    }

    public init(_ children: [any Page]) {
        self.children = children
    }

}
