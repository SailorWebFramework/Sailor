//
//  TextString.swift
//  
//
//  Created by Joshua Davis on 3/7/24.
//

import Foundation
import Sailboat

// TODO: fix this not to render a div, tag content should have no "text" text should just be in the func
// TODO: make this a Operator?

/// The Body of HTML only should be used optionally in Website struct.
public struct TextString: Element {
    
    /// name of the html tag associated with this type
    public var name: String { "div" }
    
    ///
    public var id: ElementID = UUID().uuidString

    /// attributes associated with this type
    public var attributes: [String: String]

    /// events associated with this type
    public var events: [String: (EventResult) -> Void]

    /// content that is contained by this html element
    public var content: TagContent

    ///
    public var renderer: some Renderable = JSNode(root: true)

    public init(_ text: String) {
        self.content = .text(text)
        self.attributes = .init()
        self.events = .init()
    }
//
//    public init(@PageBuilder content: @escaping () -> any Operator) {
//        self.content = .list(content)
//        self.attributes = .init()
//        self.events = .init()
//
//    }
//
//    public init() {
//        self.content = .text("")
//        self.attributes = .init()
//        self.events = .init()
//    }


}

