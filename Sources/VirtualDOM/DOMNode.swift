
import JavaScriptKit

// TODO: make internal somehow
public class DOMNode {

    /// string content on HTML element
    public var content: String
    
    /// HTML attributes attached to this node
    public var attributes: Attributes

    /// HTML events added to this node
    public var events: Events

    /// child dom nodes contained by this HTMLElement, only one child (ie: body) for a Page
    public var children: [DOMNode]
    
    /// 
    public var parent: DOMNode?

    ///
    // TODO: remove this?
    public var page: any Page 

    /// the javascript pointer to element in the DOM
    public var element: JSValue?
    
    public var isHTMLElement: Bool { self.page is any HTMLElement }

    // TODO: maybe remove page, raplace with type?
    init(
        page: any Page, 
        element: JSValue? = nil, 
        content: String = "", 
        attributes: Attributes = [:],
        events: Events = [:],
        children: [DOMNode] = [], 
        parent: DOMNode? = nil
    ) {
        self.page = page
        self.parent = parent

        self.content = content
        self.children = children
        self.attributes = attributes
        self.events = events
        
        self.element = element
        
//        print("BUILDING: \(type(of: self.page))")

        if self.element != nil {
        
            if !self.content.isEmpty {
                self.element?.textContent = JSValue.string(self.content)
            }

            for (key, value) in self.attributes {
                _ = self.element?.setAttribute(key.description, value.description)
            }
            
            for (eventName, jsclosure) in self.events {
                _ = self.element?.addEventListener(eventName, jsclosure)
            }

        }

    }

    public func renderToDOM() {
        _ = self.parent?.element?.appendChild(self.element)
    }

    public func append(_ domNode: DOMNode) {
        self.children.append(domNode)
    }
    
    
    public func removeFromParent() {
        // remove from parent
        self.parent?.children.removeAll { $0 === self }
    }
    
    public func reset(to page: any Page) {
        self.remove()
        self.page = page

        if let page = page as? any HTMLElement {
            self.element = App.document.createElement(page.name)
        } else {
            self.element = parent?.element
        }
        
    }
    
    public func remove() {
        // remove html elements from DOM
        self.removeDeepFromDOM()
        
        // free children in memory
        self.children = []
        self.element = nil
        self.attributes = [:]
        self.events = [:]
        self.content = ""

    }

    private func removeDeepFromDOM() {
        if let page = self.page as? any HTMLElement {
            _ = element?.remove()
        }

        for child in children {
            child.removeDeepFromDOM()
        }
        
    }
    
    public func printTree(_ tabAmt: Int = 0) {
        if self.page is any HTMLElement {
            print(("\t" * tabAmt) + "HTMLE:\(type(of: self.page))")
        } else {
            print(("\t" * tabAmt) + "Type:\(type(of: self.page))")
        }
        print(("\t" * tabAmt) + "Content: \(self.content)")
        print(("\t" * tabAmt) + "Attributes: \(self.attributes)")
        print(("\t" * tabAmt) + "Body:")

        for element in children {
            element.printTree(tabAmt + 1)
        }

    }

}
