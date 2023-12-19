
import JavaScriptKit

extension App {

    static func forceUpdate() {
        App.document.body.innerHTML = ""
        build()
    }
    
    /// updates a state variable to a value and redraws neccisary parts of the DOM
    static func update(state: StateNode, newValue: StateValue) {
        guard let root = self.root else { return }
        guard let rootDomNode = self.virtualDOM?.children.first else { return }

        // update the state
//        Self.states[state] = newValue
        state.value = newValue
        
        // uncomment to force update every state change
        // App.forceUpdate()
        
        diff(page: root, domNode: rootDomNode)
        
        print("PRINTING TREE")
        self.virtualDOM?.printTree()
        print("States nodes:", states.total())

    }

    static func diff(page: any Page, domNode: DOMNode) {
        print("NODE:", domNode)
        print("PAGE:", page)

        // compare if tag is the same
        if !domNode.compareTag(to: page) {
            // replace element if it is not the same
            domNode.replace(page)
            return
        }
        
        guard let page = page as? any HTMLElement else {
            if let bodyChild = domNode.children.first {
                return diff(page: page.body, domNode: bodyChild)
            }
            // TODO: should never get here?
            print("SOMETHING REALLY WENT WRONG:")
            domNode.replace(page)
            return
        }
        
        // update dom item state if different
        
        if !domNode.compareAttributes(to: page) {
            domNode.update(attributes: page.attributes)
        }
        
        if !domNode.compareContent(to: page) {
            domNode.update(content: page.content)
        }
        
        if !domNode.compareEvents(to: page) {
            domNode.update(events: page.events)
        }
        
        // loop over children
        
        let (oldSize, newSize) = (domNode.children.count, page.children.count)
        let endRange = min(oldSize, newSize)
        
//        print("SIZE DIFF:", oldSize, newSize, endRange)
        
        for i in 0..<endRange {
            diff(page: page.children[i], domNode: domNode.children[i])
        }
        
        // if old dom had more elements than new dom
        if oldSize > newSize {
            for i in (endRange..<oldSize).reversed() {
                print("Remving SHOULD DEALLOC:", domNode.children[i])
                domNode.children[i].delete()
            }
        }
        
        // if old dom had less elements than new dom
        if oldSize < newSize {
            for i in endRange..<newSize {
//                print("Building New:", page.children[i])
                page.children[i].build(parentNode: domNode)
            }
        }

    }
    
}
