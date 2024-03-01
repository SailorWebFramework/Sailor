//
//  List.swift
//  
//
//  Created by Joshua Davis on 10/12/23.
//

public struct List: Operator {
    
    // TODO: make this ID field unique?
    public var id: String = ""

    public var children: [any Page]

    public var body: some Page {
        InternalError.recursingInPageBody(name: "container")
        return self
    }
    
    public init() {
        self.init([])
    }

    public init(_ children: [any Page]) {
        self.children = children

    }
    
    public init(@PageBuilder _ builder: @escaping () -> any Operator) {
        self.children = builder().children

    }

}
