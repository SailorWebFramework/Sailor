
import JavaScriptKit

//TODO: I think i should put list as a DOMNODE for optimization purposes
public class DOMNode {
    public var content: String
    public var attributes: Attributes
    public var children: [DOMNode]
    public var parent: DOMNode?
    public var page: any Page 

    // once you do this build, remove and update can just pass around DOMNode
    // also maybe remove element from page and only keep in DOMNode
    public var element: JSValue?

    init(page: any Page, element: JSValue? = nil, content: String = "", attributes: Attributes = [:], children: [DOMNode] = [], parent: DOMNode? = nil) {
        self.page = page
        self.parent = parent
        self.element = element
        self.content = content
        self.attributes = attributes
        self.children = children
    }

    func updateAttributes(attributes: Attributes? = nil) {
        // TODO: make this more effieciet and diff the attributes
        // copy and update? seems weird
        if var htmlPageCopy = self.page as? any HTMLElement, attributes != nil {
            if let attributes = attributes {
                htmlPageCopy.attributes = attributes
            }

            self.page = htmlPageCopy 
        }

        guard let page = self.page as? any HTMLElement,
              var element = self.element
        else {
            return
        }

        // remove old attributes
        for (name, _) in self.attributes {
            element.removeAttribute(name.description)
        }

        // add new attributes
        self.attributes = page.attributes

        for (name, value) in self.attributes {
            _ = element.setAttribute(name.description, value.description)
        }
    }

    func updateInner(content: String? = nil, children: [any Page]? = nil) {
        // TODO: double check logic

        print("UPDATING \(type(of: self.page))")

        // Unsafe but probably fine
        if var htmlPageCopy = self.page as? any HTMLElement, children != nil || content != nil {
            if let children = children {
                htmlPageCopy.children = children
            }

            if let content = content {
                htmlPageCopy.content = content
            }

            self.page = htmlPageCopy 
        }

        guard let page = self.page as? any HTMLElement,
              let parent = self.parent,
              var element = self.element
        else {
            return
        }

        // add content
        if self.content != page.content {
            self.content = page.content
            element.textContent = JSValue.string(self.content)
        }

        // remove all old children
        for child in self.children {
            child.remove()
        }

        // add new children
        for child in page.children {
            child.build(parentNode: parent)
        }
    }

    func append(_ domNode: DOMNode) {
        self.children.append(domNode)
    }

    func printTree() {
        if let htmlPage = self.page as? any HTMLElement {
            print("HTML:\(type(of: self.page))")
        } else {
            print("Type:\(type(of: self.page))")
        }
        print("Content: \(self.content)")
        print("Attributes: \(self.attributes)")

        print("Body:")

        for element in children {
            element.printTree()
        }

    }

    func removePageFromDOM(_ node: DOMNode) {
        if let page = node.page as? any HTMLElement {
            print("REMOVING \(type(of: node.page))")

            if !(page is List) {
                _ = element?.remove()
            }


        }

        for child in children {
            removePageFromDOM(child)
        }

        // if let page = page as? List {
        //     for child in page.children {
        //         removePageFromDOM(child)
        //     }

        // } else if let page = page as? any HTMLElement {
        //     print("REMOVING \(type(of: self.page))")
        //     _ = element?.remove()
        //     for child in page.children {
        //         removePageFromDOM(child)
        //     }

        // } else {
        //     removePageFromDOM(page.body)
        // }
    }


    func replace(_ page: any Page) {
        // TODO: replace tag with another
        // TODO: edit if its not an HTMLElement

        if type(of: page) == type(of: self.page) {
            if !(page == self.page) {

                if !(page.attributes == self.page.attributes) {
                    print("UPDATING ATTRIBUTES")
                    self.updateAttributes(attributes: page.attributes)
                }
                
                if !(page == self.page), let htmlPage = page as? any HTMLElement {
                    print("UPDATING updateInner")
                    self.updateInner(content: htmlPage.content, children: htmlPage.children)
                } else {
                    print("UPDATING page element, i dont think possible")
                }
            }
        } else {
            print("REMOVING AND REPLACING")

            // remove old html elements
            self.removePageFromDOM(self)
            
            // remove children
            self.children = []

            // make a new page on this domnode
            self.page = page
            
            // rebuild this new page (should never fail? only optional for Body())
            if let parent = self.parent {
                self.page.build(parentNode: parent, domNode: self)
            }

            // build appends to parent again
            // self.parent?.children.removeLast()

        }
    }

    public func remove() {
        //TODO: may have to recursivly call this on all children
        guard var element = self.element else { return }

        if self.page is any HTMLElement {
            _ = element.remove()
        }
        
        print("trying to remove from parent")
        if let parent = self.parent {
            print("removing:", parent.children.count)
            parent.children.removeAll { $0 === self }
            print("after:", parent.children.count)

        }

        // TODO: Free page in memory

    }


    // TODO: these meathods feel weird / pointless
    func compareOuter(to page: any Page) -> Bool {
        return self.page.outerEquals(to: page)
    }

    // func compareInner(to page: any Page) -> {

    // }

    func compare(to page: any Page) -> Bool {
        return self.page == page
    }

}