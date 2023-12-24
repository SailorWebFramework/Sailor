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
        aboveElement: JSObject//,
        //parent: PageNode
    ) {
        
        self.content = page.content
        self.attributes = page.attributes
        self.events = [:]
        self.element = App.document.createElement(page.name).object
        
        super.init(page: page, aboveElement: aboveElement)
        
        
        self.setup(page: page)
    }
    
    private func setup(page: any HTMLElement) {
        for (name, event) in page.events {
            let closure = event.getClosure()
            self.events[name] = closure
            _ = self.element?.addEventListener?(name, closure)
        }
                
        if case let .text(value) = self.content {
            self.element?.textContent = JSValue.string(value)
        }

        for (key, value) in self.attributes {
            _ = self.element?.setAttribute?(key.description, value.description)
        }
    }
    
    public override func renderToDOM() {
        _ = aboveElement?.appendChild?(self.element)
    }
    
    public override func append(_ domNode: PageNode) {
        super.append(domNode)
        domNode.aboveElement = self.element
        
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
    
    func compareAttributes(to page: any HTMLElement) -> Bool {
        return self.attributes == page.attributes
    }
    
    // TODO: get compare events working properly??
    func compareEvents(to page: any HTMLElement) -> Bool {
        return page.events.keys == (self.page as? any HTMLElement)?.events.keys
    }
    
    func compareTextContent(to page: any HTMLElement) -> Bool {
        guard case let .text(newText) = page.content else { return false }
        guard case let .text(curText) = self.content else { return false }

        return newText == curText
    }
    
}
