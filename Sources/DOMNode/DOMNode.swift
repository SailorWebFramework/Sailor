
import JavaScriptKit

public typealias DOMChildNode = LinkedListNode<DOMNode>

// TODO: make internal somehow
public class DOMNode {
    public static var total = 0

    /// string content on HTML element
//    public var content: String
        
    public var content: TagContent? = nil

    /// HTML attributes attached to this node
    public var attributes: Attributes
    
    //TODO: maybe remove, dont think i can compare type of action anyway
    /// HTML events added to this node
    public var events: Events
    
    /// event closure references for each rendered event
    public var eventClosures: [String:JSClosure]
    
    // TODO: Make a linked list
    /// child dom nodes contained by this HTMLElement, only one child (ie: body) for a Page
    public var children: [DOMNode]
    
//    public var children: LinkedList<DOMNode>
    
    /// weak reference to parent node in dom tree
    weak public var parent: DOMNode?
        
    ///
    public var page: any Page 

    /// the javascript pointer to element in the DOM
    public var element: JSValue?
    
//    public var isHTMLElement: Bool { self.page is any HTMLElement }

    init(
        page: any Page, 
        element: JSValue? = nil,
        parent: DOMNode? = nil
    ) {
        self.page = page
        self.parent = parent
        self.element = element
        self.children = []
        self.eventClosures = [:]
        
        Self.total += 1

        if let page = page as? any HTMLElement {
            self.content = page.content
            self.attributes = page.attributes
            self.events = page.events

        } else {
            self.content = nil
            self.attributes = [:]
            self.events = [:]
        }

        
        // TODO: maybe use update functions here to look nicer?
        if self.element != nil {
            if case let .text(value) = self.content {
                self.element?.textContent = JSValue.string(value)
            }

            for (key, value) in self.attributes {
                _ = self.element?.setAttribute(key.description, value.description)
            }
            
            for (eventName, event) in self.events {
                eventClosures[eventName] = event.getClosure()
                _ = self.element?.addEventListener(eventName, eventClosures[eventName])
            }

        }

    }
    
    deinit {
        Self.total -= 1

        print("Deallocated DOMNODE: total \(Self.total)")
        print(self)

    }

    public func renderToDOM() {
        _ = self.parent?.element?.appendChild(self.element)
    }

    public func append(_ domNode: DOMNode) {
//        let node = self.children.append(domNode)
//        domNode.node = node
        self.children.append(domNode)

        domNode.parent = self
    }
    
    // TODO: make better with linked list
    public func removeFromParent() {
        // remove from parent
        self.parent?.children.removeAll { $0 === self }
//        self.node?.remove()
        
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
//        self.children.clear()
        self.attributes = [:]
        self.content = nil
        
        
        // remove events
        for (eventName, closure) in self.eventClosures {
            print("REMOVING CLOSURES!")
            _ = self.element?.removeEventListener(eventName, closure)
        }
        
        self.events = [:]
        self.eventClosures = [:]
        
        
        // remove element reference
        self.element = nil

    }
    
    public func delete() {
        self.remove()
        self.removeFromParent()
    }

    private func removeDeepFromDOM() {
        if let page = self.page as? any HTMLElement {
            _ = element?.remove()
        }
        
        for child in self.children {
            child.removeDeepFromDOM()
        }
        
    }
    
    public func printTree(_ tabAmt: Int = 0) {
//        if self.page is any HTMLElement {
//            print(("\t" * tabAmt) + "HTMLE:\(type(of: self.page))")
//        } else {
//            print(("\t" * tabAmt) + "Type:\(type(of: self.page))")
//        }
        
        print(("\t" * tabAmt) + "Type:\(type(of: self.page))")

        print(("\t" * tabAmt) + "Content: \(self.content)")
        print(("\t" * tabAmt) + "Attributes: \(self.attributes)")
        print(("\t" * tabAmt) + "Events: \(self.events)")

        print(("\t" * tabAmt) + "{")

        for element in children {
            element.printTree(tabAmt + 1)
        }
        
        print(("\t" * tabAmt) + "}")


    }

}
