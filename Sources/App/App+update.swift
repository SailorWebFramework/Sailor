
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
        
        // diff and update the state
        diff(page: rootNode.page, domNode: rootNode)
        
        // debug printing
        self.bodyNode?.print()
        
        print("States nodes:")
        Self.states.printList()

    }
    
    // TODO: remove page from diff and just verify domNodes??? mayb
    // TODO: FIX
    static func diff(page: any Page, domNode: PageNode) {
//        print("NODE:", domNode)
//        print("PAGE:", page)
//
//        // compare and replace tag if its not the same
//        if !domNode.compareTag(to: page) {
//            print("REPLACING^^")
//            domNode.replace(using: page)
//            return
//        }
//        
//        // TODO: fix this
//        if let page = page as? any HTMLElement {
//            // if page is html element
//            domNode.diffAndReplaceOuter(page)
//            domNode.page = page
//            return
//        } else if let page = page as? any Operator {
//            // if page is operator
//            
//            // loop over children
//            let (oldSize, newSize) = (domNode.children.count, page.children.count)
//            let endRange = min(oldSize, newSize)
//
//            for i in 0..<endRange {
//                diff(page: page.children[i], domNode: domNode.children[i])
//            }
//
//            // if old dom had more elements than new dom, delete
//            if oldSize > newSize {
//                for i in (endRange..<oldSize).reversed() {
//                    print("REMOVING EXTRA CHILD")
//                    domNode.children[i].delete()
//                }
//            }
//
//            // if old dom had less elements than new dom, build
//            if oldSize < newSize {
//                print("ADDING EXTRA CHILD")
//
//                for i in endRange..<newSize {
//                    BuildFactory.build(page: page.children[i], parentNode: domNode)
//                }
//            }
//
//            domNode.page = page
//        } else {
//            // if is custom page
//        }
        
        
        
//        
//        let children: [any Page]
//
//
//        if let page = page as? any Operator {
//            children = page.children
//            domNode.page = page
//            
//        } else if let page = page as? any HTMLElement {
//            domNode.diffAndReplaceOuter(page)
//            domNode.page = page
//
//            if case let .list(content) = page.content {
//                children = content().children
//            } else {
//                children = []
//            }
//            
//
//        } else {
//            domNode.page = page
//            
//            if let bodyChild = domNode.children.first {
//                return diff(page: page.body, domNode: bodyChild)
//            }
//            
//            InternalError.builtPageShouldHaveBody()
//            return
//        }
//        
//        // set the page of the domNode equal to the updated version
//
//        // loop over children
//        let (oldSize, newSize) = (domNode.children.count, children.count)
//        let endRange = min(oldSize, newSize)
//        
//        for i in 0..<endRange {
//            diff(page: children[i], domNode: domNode.children[i])
//        }
//
//        // if old dom had more elements than new dom, delete
//        if oldSize > newSize {
//            for i in (endRange..<oldSize).reversed() {
//                print("REMOVING EXTRA CHILD")
//                domNode.children[i].delete()
//            }
//        }
//
//        // if old dom had less elements than new dom, build
//        if oldSize < newSize {
//            print("ADDING EXTRA CHILD")
//
//            for i in endRange..<newSize {
//                BuildFactory.build(page: children[i], parentNode: domNode)
//            }
//        }
//            
//        domNode.page = page
    }
    
}
