//
//  List.swift
//  
//
//  Created by Joshua Davis on 10/12/23.
//

import JavaScriptKit

// TODO: make inline arrays work?
//extension [any Page]: Listable { }


// TODO: make new file and consider changing name to avoid SwiftUI collision?
// TODO: maybe override init for OL element and use it like this?
public struct List: HTMLElement {

    public var attributes: Attributes

    var children: [any Page]
    var content: String
    var element: JSValue
    var tagName: String {
        "List"
    }

    public var body: some Page {
        return self
    }
    
    public init() {
        self.init([])
    }

    public init(_ children: [any Page]) {
        self.children = children
        self.content = ""
        // TODO: make an empty node?
        self.element = App.document.createElement("div") // not real html element
        self.attributes = .init()

    }
    
    // public func build(parentNode: DOMNode, domNode: DOMNode? = nil) {
    //     // loop over children component if any
    //     for child in children {
    //         child.build(parentNode: parentNode)
    //     }

    // }
}
