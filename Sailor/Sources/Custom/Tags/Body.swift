//
//  Body.swift
//
//  Created by Joshua Davis.
//

import Foundation
import Sailboat

/// The Body of HTML only should be used optionally in Website struct.
public struct Body: Element {
//    public struct ElementAttributeGroup: AttributeGroup, GlobalAttributeGroup {
//        public let name: String
//        public let value: String
//
//        public init(name: String, value: String) {
//            self.name = name
//            self.value = value
//        }
//
//    }

    /// name of the html tag associated with this type
    public var name: String { "body" }
    
    public var id: ElementID = UUID().uuidString

    /// attributes associated with this type
    public var attributes: [String: String]

    /// events associated with this type
    public var events: [String: (EventResult) -> Void]

    /// content that is contained by this html element
    public var content: TagContent

    // TODO: make this SailboatGlobal.documentNode ??
    public var renderer: some Renderable = JSNode()

    public init(_ text: String) {
        self.content = .text(text)
        self.attributes = .init()
        self.events = .init()
    }

    public init(@PageBuilder content: @escaping () -> any Operator) {
        self.content = .list(content)
        self.attributes = .init()
        self.events = .init()

    }

    public init() {
        self.content = .text("")
        self.attributes = .init()
        self.events = .init()
    }


}
