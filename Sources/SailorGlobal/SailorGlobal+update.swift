
import JavaScriptKit

extension SailorGlobal {

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
    static func diff(page: any Page, domNode: any PageNode) {
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
            print("updating HTML node: \(page)")
            domNode.update(using: page)

            switch page.content {
            case .text(_):
                if !domNode.children.isEmpty {
                    print("REPLACING text with HTML")
                    domNode.replace(using: page)
                    return
                }
            case .list(let makeList):
                if !domNode.children.isEmpty {
                    print("DIFFING INNER OPERATOR")
                    diff(page: makeList(), domNode: domNode.children[0])
                } else {
                    print("Making new body in HTML")
                    domNode.build(child: makeList())
                }
            }

        } else if let page = page as? any Operator {
            // if page is operator
            print("doing operator: \(page)")

            // loop over children
            let (oldSize, newSize) = (domNode.children.count, page.children.count)
            let endRange = min(oldSize, newSize)
            
            
            for i in 0..<endRange {
                diff(page: page.children[i], domNode: domNode.children[i])

            }
            
            // TODO: dont think this is possible currently because size never changes with conditional
            // TODO: When creating ol items with ids and resizable will need this and have it change
            // if old dom had more elements than new dom, delete
            if oldSize > newSize {
                print("REMOVING EXTRA CHILD")
                
                for i in endRange..<oldSize {
                    domNode.children[i].removeFromDOM()
                }

            }

            // if old dom had less elements than new dom, build
            if oldSize < newSize {
                print("ADDING EXTRA CHILD")
                for i in endRange..<newSize {
                    domNode.build(child: page.children[i])
                }

            }
            
        } else {
            // if is custom page
            // TODO: check id? or somthing
            print("doing custom page: \(page)")
            // TODO: DO ERROR CHECK, should never happen though
            diff(page: page.body, domNode: domNode.children[0])

        }

    }
    
}
