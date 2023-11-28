
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
            // somehow this updates page
            let comparison = domNode.compareOuter(to: page) //domNode.compare(to: page)
            // let comparison = domNode.compareInner(to: page) //domNode.compare(to: page)

            print(type(of: page), type(of: domNode.page))
            print("COMPARING: ", comparison)
            
            if let dompage = domNode.page as? any HTMLElement,
               let page = page as? any HTMLElement {
                print("content: ", dompage.content, page.content)
                print("attribtues: ", dompage.attributes, page.attributes)
                print("children: ", dompage.children, page.children)
            }

            // check comparison
            if !comparison {
                print("REPLACING ^ above:")
                domNode.replace(page)

                // if let page = page as? any HTMLElement {
                //     // TODO: better match to node 
                //     var index = 0
                //     while page.children.count > index && domNode.children.count > index {
                //         diff(page: page.children[index], domNode: domNode.children[index])
                //         index += 1
                //     }

                //     if page.children.count == 0 {
                //         domNode.replace(page)
                //     }
                // }
            } 
            // else {
                // print("CHILDREN:", domNode.children.count)

            if let page = page as? any HTMLElement {

                var index = 0
                while page.children.count > index && domNode.children.count > index {
                    diff(page: page.children[index], domNode: domNode.children[index])
                    index += 1
                }
                // TODO: tailcase

            } else {    
                // TODO: maybe replace with .first cuz should only be one child
                for child in domNode.children {
                    diff(page: page.body, domNode: child)
                }
            }
            // }

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