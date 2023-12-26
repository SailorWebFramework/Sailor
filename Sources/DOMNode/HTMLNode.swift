//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/22/23.
//

import Foundation
import JavaScriptKit

// TODO:

public class HTMLNode: PageNode {
    
    /// string content on HTML element
    public var content: TagContent

    /// HTML attributes attached to this node
    public var attributes: Attributes
    
    /// event closure references for each rendered event
    public var events: [String: JSClosure]
    
    /// the javascript pointer to element in the DOM
    public var element: JSObject?

    override public var description: String {
        "HTMLNode(type: \(type(of:self.page)), attributes: \(self.attributes), content: \(self.content)), events: \(self.events.keys), children: \(self.children.count))"
    }
    
    init(
        page: any HTMLElement,
        aboveElement: JSObject,
        element: JSObject? = nil
    ) {
        
        self.content = page.content
        self.attributes = page.attributes
        self.events = [:]
        
        if element != nil {
            self.element = element
        } else {
            self.element = App.document.createElement(page.name).object
        }
        
        super.init(page: page, aboveElement: aboveElement)
        
        
        self.setup(page: page)
    }

    private func setup(page: any HTMLElement) {
        build(events: page.events)
        
        if case let .text(value) = page.content {
            build(textContent: value)
        }

        build(attributes: page.attributes)
    }
    
    
    public override func renderToDOM() {
        _ = aboveElement?.appendChild?(self.element)
    }
    
    public override func append(_ domNode: PageNode) {
        super.append(domNode)
        if let element = self.element {
            domNode.aboveElement = self.element
        }
    }
    
    public override func update(using page: any Page) {
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
    }
    
    internal override func remove() {
        super.remove()
        
        for (name, closure) in self.events {
            _ = self.element?.removeEventListener?(name, closure)
        }
        
        self.events = [:]
        
        self.content = .text("")
        
        // remove old attributes
        for (name, _) in self.attributes {
            _ = self.element?.removeAttribute?(name.description)
        }
        
        self.attributes = [:]
        
        _ = self.element?.remove?()

    }
    
//    func replace(_ page: any HTMLElement) {
//        
//        self.removeFromDOM()
//        self.removeFromParent()
//
//        self.page = page
//        
//        
//        // TODO:
////        BuildFactory.rebuild(self)
//        
//        self.renderToDOM()
//
//    }
    
}
