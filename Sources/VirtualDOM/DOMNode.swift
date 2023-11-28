
import JavaScriptKit

//{
//   name: TestPage
//   content: ""
//   states: [0, 1, 2, 3] // opt: states can only be passed down not up
//   attributes: ["src": hello", "width": 10]
//   body: { name: Div, content: "hello world", body: {} }
//
//
//}
public class DOMNode {
    public var content: String
    public var attributes: Attributes
    public var children: [DOMNode] // rename to children
    public var parent: DOMNode?
    public var page: any Page // TODO: somehow make this HTMLElement? right now im just casting

    // once you do this build, remove and update can just pass around DOMNode
    // also maybe remove element from page and only keep in DOMNode
    public var element: JSValue?
    // {
    //     ((self.page as? HTMLElement).element)
    // }

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
        self.content = page.content

        if !self.content.isEmpty {
            element.textContent = JSValue.string(self.content)
        }

        // remove all old children
        // for child in self.children {
        //     child.remove()
        // }

        // add new children
        // for child in page.children {
        //     child.build(parent: element, virtualDOM: parent)
        // }
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
            // if old page is html and new page is not
            // if old is and new is
            // if old isnt but new is

            if var element = self.element {
                _ = element.remove()
            }

            self.page = page

            if let newElement = (self.page as? any HTMLElement)?.element {
                self.element = newElement
            } else {
                self.element = nil
            }

            self.updateAttributes()
            self.updateInner()
        }
    }

    public func remove() {
        //TODO: may have to recursivly call this on all children
        guard var element = self.element else { return }

        _ = element.remove()
        
        print("trying to remove from parent")
        if let parent = self.parent {
            print("removing:", parent.children.count)
            parent.children.removeAll { $0 === self }
            print("after:", parent.children.count)

        }

        // TODO: Free page in memory

    }

    func compareOuter(to page: any Page) -> Bool {
        return self.page.outerEquals(to: page)
    }

    // func compareInner(to page: any Page) -> {

    // }

    func compare(to page: any Page) -> Bool {
        return self.page == page
    }

}