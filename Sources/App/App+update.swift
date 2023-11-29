
import JavaScriptKit

extension App {

    static func forceUpdate() {
        App.document.body.innerHTML = ""
        build()
    }

    // TODO:
    private static func match(to page: any Page, parent: DOMNode) -> DOMNode {
        return parent
    }

    // TODO: update the view if the DOM changed
    static func update(state: Int, newValue: Any) {
        guard let root = self.root else { return }
        guard let rootDomNode = self.virtualDOM.children.first else { return }

        // update the state
        Self.states[state] = newValue
        
        // TODO: Remove and diff , dont delete everything
        // App.forceUpdate()

        func diff(page: any Page, domNode: DOMNode) {
            // somehow this may update page so stored value?
            let comparison = domNode.compareOuter(to: page) // domNode.compare(to: page)

            // debug prints, remove these prints eventually 
            print(type(of: page), type(of: domNode.page))
            print("COMPARING: ", comparison)
            print("attribtues: ", domNode.attributes, page.attributes)

            if let dompage = domNode.page as? any HTMLElement,
               let page = page as? any HTMLElement {
                print("content: ", dompage.content, page.content)
            }

            // check comparison
            if !comparison {
                // replace element if it is not the same
                domNode.replace(page)
                print("REPLACING ^ above:")
            } 

            // TODO: Deal with deletions and additions not just modifications
            if let page = page as? any HTMLElement {
                // Self.match(to: page,  parent: domNode)
                var index = 0
                while page.children.count > index && domNode.children.count > index {
                    diff(page: page.children[index], domNode: domNode.children[index])
                    index += 1
                }

                // TODO: tailcase
                // add extra elements
                // if page.children.count > domNode.children.count {
                //     for i in domNode.children.count..<page.children.count {
                //         // TODO: build the new page, remove parent
                //         page.build(parent: domNode.element, virtualDOM: domNode)
                        
                //     }
                // }

                // // remove extra elements
                if page.children.count < domNode.children.count {
                    for i in page.children.count..<domNode.children.count {
                        domNode.children[i].remove()
                    }
                }

            } else {    
                // TODO: maybe replace with .first cuz should only be one child
                for child in domNode.children {
                    diff(page: page.body, domNode: child)
                }
            }

        }

        diff(page: root, domNode: rootDomNode)
        
        print("PRINTING TREE")
        self.virtualDOM.printTree()
        // simple diff 1.0
        
        // loop over old dom and new dom

        // if element is the same do nothing continue in loop

            
        // else the dom falls in one of three simplified states (could be multiple)
            // replaced an element
                // compare if types are different
                // if same -> compare value, recurse page, or replace html component
                // if different -> replace

            // added a new element in between
                // cache the old element with pointer
                // if future value is cache then append new element before when updating

            // removed an element
                // cache the old element with pointer
                // if never found remove element from dom at the end
    }
}