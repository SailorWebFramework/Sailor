
import JavaScriptKit

extension App {

    // TODO: make sure this works, or depricate it?
//    static func forceUpdate() {
//        guard let rootNode = self.virtualDOM else { return }
//
//        rootNode.element?.innerHTML = ""
//        build(root: rootNode.page)
//    }
    
    /// updates a state variable to a value and redraws neccisary parts of the DOM
    static func update(state: StateNode, newValue: StateValue) {
        guard let rootNode = self.bodyNode else { return }

        // update the state
        state.value = newValue
        
        print("DIFFING:")
        // diff and update the state
        diff(page: rootNode.page, domNode: rootNode)
        
        // debug printing
        self.bodyNode?.printNode()
        Self.states.printList()

    }
    
    // TODO: remove page from diff and just verify domNodes??? mayb
    // TODO: FIX
    static func diff(page: any Page, domNode: PageNode) {
        print("d:", domNode, "||", "PAGE:", page)

        // compare and replace tag if its not the same
        if !domNode.compareTag(to: page) {
            print("REPLACING different node \(type(of:page)) \(type(of:domNode.page))")
            domNode.replace(using: page)
            return
        }
        
        // TODO: fix this
        if let page = page as? any HTMLElement {
            // if page is html element
            print("doing HTML node: \(page)")
            
            switch page.content {
            case .text(_):
                if domNode.children.isEmpty {
                    print("UPDATING CHILDREN TEXT")
                    domNode.update(using: page)
                    return
                } else {
                    print("REPLACING INNER HTML")
                    domNode.replace(using: page)
                    print("AM I STUCK")

                    print(domNode.children.count)
                    return
                }
            case .list(let makeList):
                if let listNode = domNode.children[0] {
                    print("DIFFING INNER OPERATOR")
                    diff(page: makeList(), domNode: listNode)
                }
            }

        } else if let page = page as? any Operator {
            // if page is operator
            print("doing operator: \(page)")

            // loop over children
            let (oldSize, newSize) = (domNode.children.count, page.children.count)
            let endRange = min(oldSize, newSize)
            
            var i = 0
            var domptr = domNode.children.head
            
            while i < endRange {
                if let value = domptr?.value {
                    diff(page: page.children[i], domNode: value)
                }
                domptr = domptr?.next
                i += 1
            }

//            // if old dom had more elements than new dom, delete
//            if oldSize > newSize {
//                print("REMOVING EXTRA CHILD")
//                while i < oldSize {
//                    domptr?.value.delete()
//                    domptr = domptr?.next
//                    i += 1
//                }
//
//            }
//
//            // if old dom had less elements than new dom, build
//            if oldSize < newSize {
//                print("ADDING EXTRA CHILD")
//                while i < newSize {
//                    BuildFactory.build(page: page.children[i], parentNode: domNode)
//                    i += 1
//                }
//
//            }
            
        } else {
            // if is custom page
            // TODO: check id? or somthing
            print("doing custom page: \(page)")
            // TODO: DO ERROR CHECK, should never happen though
            diff(page: page.body, domNode: domNode.children[0]!)

        }

    }
    
}
