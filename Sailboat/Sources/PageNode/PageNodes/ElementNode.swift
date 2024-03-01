//
//  ElementNode.swift
//  
//
//  Created by Joshua Davis on 12/22/23.
//


final public class ElementNode: PageNode {
    public var children: [any PageNode]
    
    weak public var parent: (any PageNode)?
        
    public var page: any Page
    
    // TODO: change from enum to just makelist func but then make TextContent be a any HTMLNode or HTMLElement
    /// string content on HTML element
    public var content: TagContent

//    associatedtype AttributeType: Attributable

    /// HTML attributes attached to this node
    public var attributes: [String: String]
    
    /// event closure references for each rendered event
    public var events: [String: (EventResult) -> Void]

    public var description: String {
        "ElementNode(type: \(type(of:self.page)), attributes: \(self.attributes), content: \(self.content)), events: \(self.events.keys), children: \(self.children.count))"
    }
    
    public init(
        page: any Element, 
        parent: (any PageNode)?
    ) {
        
        self.content = page.content
        self.attributes = page.attributes
        self.events = page.events

        self.page = page
        self.parent = parent
        self.children = []
        
    }
    
    
    // TODO: remove this? in PageNode
    public func add() {
        
    }
    
    // TODO: remove this? in PageNode
    public func remove() {
        self.events = [:]
        self.content = .text("")
        self.attributes = [:]

    }
    
    /// update node shallowly ie: attributes, content, & events
    public func update(using page: any Page) {
        guard let page = page as? any Element else { return }
        
        self.attributes = page.attributes
        self.events = page.events
        self.content = page.content
      
    }
    
    public func compare(to page: any Page) -> Bool {
        guard let page = page as? any Element else {
            return false
        }
        
        // TODO: CHECK ATTRIBUTES HERE?
//        self.attributes == page.attributes

//        for attribute in attributes {
//            
//        }

        return (
            compareTag(to: page) &&
            self.content == page.content &&
            self.events.keys == page.events.keys
        )
    }
    
//    internal func compareAttributes(to page: any HTMLElement) -> Bool {
//
//        return self.attributes == page.attributes
//    }
    
    // TODO: get compare events working properly??
    internal func compareEvents(to page: any Element) -> Bool {
        return page.events.keys == (self.page as? any Element)?.events.keys
    }
    
    internal func compareTextContent(to newText: String) -> Bool {
        guard case let .text(curText) = self.content else { return false }

        return newText == curText
    }
    
}
