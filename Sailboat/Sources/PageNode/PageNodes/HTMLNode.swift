//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/22/23.
//

import Foundation

final public class HTMLNode: PageNode {
    public var children: [any PageNode]
    
    weak public var parent: (any PageNode)?
        
    public var page: any Page
    
    /// string content on HTML element
    public var content: TagContent

    /// HTML attributes attached to this node
    public var attributes: Attributes
    
    /// event closure references for each rendered event
    public var events: Events

    public var description: String {
        "HTMLNode(type: \(type(of:self.page)), attributes: \(self.attributes), content: \(self.content)), events: \(self.events.keys), children: \(self.children.count))"
    }
    
    init(
        page: any HTMLElement, 
        parent: (any PageNode)?
    ) {
        self.content = page.content
        self.attributes = page.attributes
        self.events = page.events

        self.page = page
        self.parent = parent
        self.children = []
        
    }
    
    public func add() {
//        guard let page = self.page as? any HTMLElement else { return }
//
//        build(events: page.events)
//
//        if case let .text(value) = page.content {
//            build(textContent: value)
//        }
//
//        build(attributes: page.attributes)

    }
    
    public func remove() {
        self.events = [:]
        self.content = .text("")
        self.attributes = [:]

    }
    
    public func update(using page: any Page) {
        // TODO: ?
        guard let page = page as? any HTMLElement else { return }
        
        if !compareAttributes(to: page) {
            update(attributes: page.attributes)
        }
        
        if !compareEvents(to: page) {
            update(events: page.events)
        }
        
        if case let .text(value) = page.content {
            if !compareTextContent(to: value) {
                build(textContent: value)
            }
        }
        
        self.content = page.content
    }
    
}
