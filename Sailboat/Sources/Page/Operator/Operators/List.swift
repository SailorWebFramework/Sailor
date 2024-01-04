//
//  List.swift
//  
//
//  Created by Joshua Davis on 10/12/23.
//

import Foundation

public struct List: Operator {
    
    public var id: UUID? = nil //UUID()

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

}
