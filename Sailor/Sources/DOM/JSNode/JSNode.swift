//
//  File.swift
//  
//
//  Created by Joshua Davis on 1/1/24.
//

import Sailboat
import JavaScriptKit


//extension HTMLElement: CustomStringConvertible {
//    var description: String {
//        var output = ""
//        for (key, value) in node.attributes {
//            output +=
//            self.addAttribute(name: key, value: value)
//        }
//        return output
//    }
//}

final class JSNode: CustomStringConvertible {
    typealias JSAttributes = [String: String]

    public static let window = JSObject.global.window
    public static let document = JSObject.global.document
    public static let body: JSObject = document.body.object!
    public static let head: JSObject = document.head.object!

    public var children: [JSNode]
    
    internal var element: JSObject
    
//    internal var content: TagContent
    internal var events: [String: JSClosure] // Events
    internal var attributes: JSAttributes
    
    internal weak var parent: JSNode?

    var description: String {
        """
        JSNode(type: \(tagName ?? ""), events: \(events.count), attributes: \(attributes), \(
                        children.count > 0 ? "children: \(children.count)" : "content: \"\(content ?? "")\""
        ))
        """
    }
    
//    var isTextComponent: Bool

    var tagName: String? {
        element.tagName.string 
    }
    
//    var attributes: JSValue {
//        element.attributes
//    }
    
    var content: String? {
//        if case let .text(value) = content {
//            return value
//        }
//        return nil
        self.element.textContent.string
    }
    
    var nodeType: Int {
        let number = element.nodeType.number
        
        return Int(number ?? -1)
    }
    
    convenience init(root: Bool = false) {
        guard let divobject = root ? JSNode.body : Self.document.createElement("DIV").object else {
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
        
        self.updateShallow(with: node)
    }
    
    // TODO: force unwrapping?
    convenience init(named name: String, events: [String: (EventResult) -> Void], attributes: JSAttributes = [:], parent: JSNode? = nil) {
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
            self.events[name] = EventResult.getClosure(name, action: event)
        }
    }
    
    private init(element: JSObject, parent: JSNode? = nil, events: [String : JSClosure] = [:], attributes: JSAttributes = [:]) {
        self.element = element
        self.events = events
        self.parent = parent
        self.attributes = attributes
        self.children = []
//        self.isTextComponent = true
    }
    
    private func replaceTag(with htmlNode: HTMLNode) {
        guard let index = self.parent?.children.firstIndex(where: { $0 === self }) else {
            fatalError("js-node doesnt exist in parent")
        }
        
        guard let pageName = (htmlNode.page as? any HTMLElement)?.name else { return }
        
        print("I AM REPLACING")

        reset()

        if tagName?.uppercased() != pageName.uppercased(),
           let parent = self.element.parentElement.object {
            let newTag = Self.document.createElement(pageName.uppercased()).object
            
            _ = parent.replaceChild!(newTag, self.element)
            // TODO: THIS IS FORCE IS IT OK
            self.element = newTag!
        }
        else {
            print("SKIPPING REplace, same tag")
        }
        
    }

    /// shallowly updates node, ie: TextContent, Attributes, & Events
    func updateShallow(with node: HTMLNode) {
        guard let page = node.page as? any HTMLElement else { fatalError() }
        
        print("updating to: \(node)")
        print("old content \(self.content)")
        print(tagName?.uppercased(), page.name.uppercased())

        // if different replace element
        if tagName?.uppercased() != page.name.uppercased() {
            self.replaceTag(with: node)
        }
        
        // remove old events and add new ones
        
        // update text
        switch node.content {
        case .text(let value):
            // THIS IS MF UP
            for child in self.children {
                child.removeFromDOM()
            }
            
            children = [] // TODO: should not need this
            
            self.editContent(text: value)
            print(self)
            
        case .list(_):
            
            // Get the length of the children collection
            let length = Int(self.element.children.length.number ?? 0)

            if length == 0 {
                self.editContent(text: "")
            }
        
        }
        
        // TODO: diff events and attributes?
        // make sure order is the same for attributes
        
        self.removeEvents()

        for (name, event) in node.events {
            self.addEvent(name: name, closure: event)
        }
        
        if node.attributes != self.attributes {
            self.removeAttributes()
            
            for (key, value) in node.attributes {
                self.addAttribute(name: key, value: value)
            }
        }
        
    }
    
    // TODO: make this (EventResult) -> Void
    private func addEvent(name: String, closure: @escaping (EventResult) -> Void) {
        let jsClosure = EventResult.getClosure(name, action: closure)
        self.events[name] = jsClosure
        
        _ = self.element.addEventListener?(name, jsClosure)
        
    }
    
    private func addAttribute(name: String, value: String) {
        _ = self.element.setAttribute?(name, value)
        self.attributes[name] = value

    }
    
    private func editContent(text: String) {
        self.element.textContent = JSValue.string(text)
    }
    
    private func removeEvents() {
        for (name, closure) in events {
            _ = self.element.removeEventListener?(name, closure)
        }
        
        self.events = [:]
    }
    
    private func removeAttributes() {
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
//        self.attributes = [:]
        self.removeEvents()
        self.removeAttributes()
        
        self.editContent(text: "")
//        self.isTextComponent = true

    }
    
//    func remove(index: Int) {
//        self.children.remove(at: index)
//
//        if self.children.isEmpty {
//            self.isTextComponent = true
//        }
//    }
    
    // TODO: may need to remove text content if the component was a TextComponent
    // ie. self.editContent(text: "")
    func addChild(_ child: JSNode) {
//        if self.isTextComponent {
//            reset()
//        }
        
//        self.isTextComponent = false

        // add child given we are parent
        child.parent = self
        child.addToParent()
    }
    
    func addToParent() {
        parent?.children.append(self)
//        _ = parent?.element.appendChild?(self.element)
        print("adding to parent??", parent?.element.appendChild?(self.element))

    }
    
    func addToDocument() {
        _ = Self.document.appendChild(self.element)
    }
    
    func removeFromDOM() {
        // remove from DOM
        
        self.parent?.children.removeAll(where: { $0 === self })
//        self.parent?.isTextComponent = self.parent?.children.isEmpty ?? true

        removeEvents()
//        removeAttributes()
        self.children = []

        _ = self.element.remove?()
        
//        self.isTextComponent = true
        
    }
    
}
