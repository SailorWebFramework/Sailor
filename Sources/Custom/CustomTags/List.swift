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

// TODO: remove list and just use Div?
public struct List: HTMLElement {

    var attributes: Attributes
    var events: Events
    var children: [any Page]
    var content: String
    
    // TODO: name this something else? error?
    var name: String { "div" }

    public var body: some Page { self }
    
    public init() {
        self.init([])
    }

    public init(_ children: [any Page]) {
        self.children = children
        self.content = ""
        self.events = [:]
        self.attributes = .init()

    }
    
    // TODO: annoying i have to update this custom
//    public func build(parentNode: DOMNode) {
//        let domNode = DOMNode(
//            page: self,
//            // TODO: this is maybe fine but element for a page element is its parent
//            element: parentNode.element,
//            parent: parentNode
//        )
//
//        parentNode.append(domNode)
//
//        for child in self.children {
//            child.build(parentNode: domNode)
//        }
//
//    }
}
