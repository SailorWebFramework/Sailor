//
//  File.swift
//  
//
//  Created by Joshua Davis on 10/12/23.
//

import Foundation
import JavaScriptKit

//import SwiftSoup

//struct Nothing: HTMLElement {
//    var element = Element(Tag(""), "")
//
//    public var attributes: Attributes
//
//    var children: [any Page]
//    var content: String
//    
//    var body: some Page {
//        return self
//    }
//    
//    public init() {
//        self.children = []
//        self.content = ""
//        self.attributes = .init()
//    }
//    
//    func build(parent: Element?) { }
//    
//    func render(id: String?) -> String { return "" }
//}

protocol Listable: HTMLElement {
    
}

// TODO: make inline arrays work?

//extension [any Page]: Listable {
//    
//}


// TODO: make new file and consider changing name to avoid SwiftUI collision?
// TODO: maybe override init for OL element and use it like this?
public struct List: Listable {

    public var attributes: Attributes

    var children: [any Page]
    var content: String
    var element: JSValue

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
        self.element = App.document.createElement("div")
        self.attributes = .init()

    }
    
    public func build(parent: JSValue) {
        do {
            // loop over children component if any
            for (i, child) in children.enumerated() {
                child.build(parent: parent)
            }

        } catch {
            // TODO: throw meaningful errors
            print("ERROR PARSING HTML")
        }
    }
}
