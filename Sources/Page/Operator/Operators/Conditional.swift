//
//  List.swift
//
//
//  Created by Joshua Davis on 10/12/23.
//

import Foundation
import JavaScriptKit

public struct Conditional: Operator {
    
    public var id: UUID = UUID()
    
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
