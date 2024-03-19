//
//  List.swift
//
//
//  Created by Joshua Davis on 10/12/23.
//

public struct List: Fragment {
    
    /// hash associated with which conditional this block is in
    public var hash: Int
    
    // TODO: make this ID field unique?
    public var children: [any Page]

    public var description: String {
        "List(children: \(children.count), hash: \(hash))"
    }
    
    public init() {
        self.init([], hash: 0)
    }

    public init(_ children: [any Page], hash: Int) {
        self.children = children
        self.hash = hash

    }

}
