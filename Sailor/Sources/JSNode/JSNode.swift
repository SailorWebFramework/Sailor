//
//  File.swift
//  
//
//  Created by Joshua Davis on 1/1/24.
//

import Sailboat
import JavaScriptKit

final class JSNode: CustomStringConvertible {
    
    public static let window = JSObject.global.window
    public static let document = JSObject.global.document
    public static let body: JSObject = document.body.object!
    public static let head: JSObject = document.head.object!

    public var children: [JSNode]
    
    internal var element: JSObject
    
//    internal var content
    internal var events: [String: [JSClosure]] // Events
    internal var attributes: Attributes
    
    internal weak var parent: JSNode?

    var description: String {
        """
        JSNode(type: \(tagName ?? ""), events: \(events.count), attributes: \(attributes), \(
                        children.count > 0 ? "children: \(children.count)" : "content: \"\(content ?? "")\""
        ))
        """
    }

    var tagName: String? {
        element.tagName.string 
    }
    
//    var attributes: JSValue {
//        element.attributes
//    }
    
    var content: String? {
        self.element.textContent.string
    }
    
    var nodeType: Int {
        let number = element.nodeType.number
        
        return Int(number ?? -1)
    }
    
    convenience init() {
        guard let divobject = Self.document.createElement("DIV").object else {
            fatalError("DIV CREATED OBJECT FAILED")
        }
        self.init(
            element: divobject
        )
    }
    
    convenience init(_ node: HTMLNode) {
        guard let page = node.page as? any HTMLElement else {
            fatalError("page node not HTMLElement")
        }
        
        guard let pageElement = Self.document.createElement(page.name).object else {
            fatalError("page node not possible")
        }
        
        self.init(
            element: pageElement,
            parent: nil,
            events: [:],
            attributes: node.attributes
        )
        
        self.update(with: node)
    }
    
    // TODO: force unwrapping?
    convenience init(named name: String, events: Events, attributes: Attributes = [:], parent: JSNode? = nil) {

        guard let pageElement = Self.document.createElement(name).object else {
            fatalError("page node not possible")
        }

        self.init(
            element: pageElement,
            parent: parent,
            events: [:],
            attributes: attributes
        )
    
        // TODO: in pageNode make events type [String: [JSClosure]]
        for (name, event) in events {
            self.events[name] = [event.getClosure()]
        }
    }
    
    init(element: JSObject, parent: JSNode? = nil, events: [String : [JSClosure]] = [:], attributes: Attributes = [:]) {
        self.element = element
        self.events = events
        self.parent = parent
        self.attributes = attributes
        self.children = []
    }
    
    func replace(with jsnode: JSNode, using htmlNode: HTMLNode) {
        guard let index = self.parent?.children.firstIndex(where: { $0 === self }) else {
            fatalError("js-node doesnt exist in parent")
        }
        
        jsnode.parent = self.parent
        self.parent?.children[index] = jsnode

        reset()

        if let parent = self.element.parentElement.object {
            print("going to replace")
            let oldReference = jsnode.element
            
            _ = parent.replaceChild!(oldReference, self.element)
            
            self.element = oldReference
            
        }
        
        self.update(with: htmlNode)
        
    }
    
    func update(with node: HTMLNode) {
//        guard let page = node.page as? any HTMLElement else { return }
        
        print("updating to: \(node)")
        
        // remove old events and add new ones
        self.removeEvents()
        
        for (name, event) in node.events {
            self.addEvent(name: name, closure: event.getClosure())
        }
        
        // update text
        switch node.content {
        case .text(let value):
            self.editContent(text: value)
        case .list(_):
//            self.editContent(text: "") // TODO: check this, remove text, what if it was text now its not?
            break

        }
        
        removeAttributes()
        
        for (name, value) in node.attributes {
            self.addAttribute(name: name, value: value)
            
        }

    }
    
    // TODO: make this (EventResult) -> Void
    func addEvent(name: String, closure: JSClosure) {
        
        if var eventList = self.events[name] {
            eventList.append(closure)
        } else {
            self.events[name] = [closure]
        }

        _ = self.element.addEventListener?(name, closure)
        
    }
    
    func addAttribute(name: Attribute, value: any AttributeValue) {
        _ = self.element.setAttribute?(name.description, value.description)
        self.attributes[name] = value.description

    }
    
    func editContent(text: String) {
        self.element.textContent = JSValue.string(text)
    }
    
    public func removeEvents() {
        for (name, closures) in events {
            for closure in closures {
                _ = self.element.removeEventListener?(name, closure)
            }
        }
        
        self.events = [:]
    }
    
    public func removeAttributes() {
        for (name, _) in attributes {
            _ = self.element.removeAttribute?(name.description)
        }
        self.attributes = [:]
    }
    
    // TODO: REMOVE EVENTS ON EXIT
    func reset() {
        for child in self.children {
            child.removeFromDOM()
        }
        
        self.children = []
        self.attributes = [:]
        removeEvents()
        self.editContent(text: "")

    }
    
    
    func addChild(_ child: JSNode) {
        // add child given we are parent
        child.parent = self
        self.children.append(child)
        
        child.addToDOM()
    }
    
    func addToDOM() {
        _ = parent?.element.appendChild?(self.element)

    }
    
    func addToDocument() {
        _ = Self.document.appendChild(self.element)

    }
    
    func removeFromDOM() {
        // remove from DOM
        
        self.parent?.children.removeAll(where: { $0 === self })
        
        removeEvents()
        self.children = []

        _ = self.element.remove?()
        
        
    }
    
}
