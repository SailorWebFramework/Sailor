
import JavaScriptKit

extension App {

    // TODO: make sure this works, or depricate it?
    static func forceUpdate() {
        guard let rootNode = self.virtualDOM?.children.first else { return }
//        guard let rootNode = self.virtualDOM?.children.head?.value else { return }

        App.document.body.innerHTML = ""
        build(root: rootNode.page)
    }
    
    /// updates a state variable to a value and redraws neccisary parts of the DOM
    static func update(state: StateNode, newValue: StateValue) {
//        guard let rootNode = self.virtualDOM?.children.head?.value else { return }
        guard let rootNode = self.virtualDOM?.children.first else { return }


        // update the state
        state.value = newValue
        
        // diff and update the state
        diff(page: rootNode.page, domNode: rootNode)

        // deprecated: uncomment to force update every state change
        // App.forceUpdate()
        
        // debug printing
        print("PRINTING TREE")
        self.virtualDOM?.printTree()
        print("States nodes:", states.count)

    }
    
    // TODO: remove page from diff and just verify domNodes??? mayb
    static func diff(page: any Page, domNode: DOMNode) {
        print("NODE:", domNode)
        print("PAGE:", page)

        // compare and replace tag if its not the same
        if !domNode.compareTag(to: page) {
            print("REPLACING^^")

            domNode.replace(page)
            return
        }

        guard let page = page as? any HTMLElement else {
//            if let bodyChild = domNode.children.head?.value {

            if let bodyChild = domNode.children.first {
                return diff(page: page.body, domNode: bodyChild)
            }
            InternalError.builtPageShouldHaveBody()
            return
        }

        // set the page of the domNode equal to the updated version
        domNode.replace(page)

        // loop over children
        let (oldSize, newSize) = (domNode.children.count, page.children.count)
        let endRange = min(oldSize, newSize)
        
        for i in 0..<endRange {
            diff(page: page.children[i], domNode: domNode.children[i])
        }

        // if old dom had more elements than new dom, delete
        if oldSize > newSize {
            for i in (endRange..<oldSize).reversed() {
                print("REMOVING EXTRA CHILD")
                domNode.children[i].delete()
            }
        }

        // if old dom had less elements than new dom, build
        if oldSize < newSize {
            for i in endRange..<newSize {
//                page.children[i].build(parentNode: domNode)
                BuildFactory.build(page: page.children[i], parentNode: domNode)
            }
        }

    }
    
}
