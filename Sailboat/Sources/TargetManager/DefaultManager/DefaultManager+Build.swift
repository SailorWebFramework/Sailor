//
//  DefaultManager+Build.swift
//  
//
//  Created by Joshua Davis on 2/2/24.
//

public extension DefaultManager {
    
    func build(page: any Page, parent: (any PageNode)?) -> any PageNode {
        
        // if page is an Operator
        if let page = page as? any Operator {

            // create new virtual dom node
            let domNode = OperatorNode(
                page: page,
                parent: parent
            )

            // add new node as a child of the current parent
            parent?.append(domNode)

            // add children
            for child in page.children {
                _ = build(page: child, parent: domNode)
            }
            
            return domNode
        }
        
        // if page is an HTMLElement
        if let page = page as? any Element {
            
            // create new virtual dom node
            let domNode = ElementNode(
                page: page,
                parent: parent
            )
            
            // add new node as a child of the current parent
            parent?.append(domNode)
            
            // render current page to parent
            
            if let managedParentElement = (self.managedPage.parentElement?.page as? any Element) {
                page.renderer.addToParent(managedParentElement.renderer)
            }
            
            // add parent to the stack and change to us as new parent
            let myParent = self.managedPage.parentElement
            self.managedPage.parentElement = domNode
            
            // ensure the stateHistoryQueue is cleared
//            let leaks = self.dump()
//            
//            print("LEAKED DUMP")
//            print(leaks)
            
            // dump the control statements associated with this page to state
            print("BUILD IS DUMPING")
            self.dumpTo(element: page, toBody: true)

            // run the page builder closure to create an operator node
            if case let .list(listpage) = page.content {
                _ = build(page: listpage(), parent: domNode)
            }
            
            // restore parent
            self.managedPage.parentElement = myParent

            // TODO: run the onAppear method

            return domNode

        }
        
        // if page is a custom page
        let domNode = CustomNode(
            page: page,
            parent: parent
        )
        
//        self.registerPageNode(domNode)
        
        parent?.append(domNode)
        _ = build(page: page.body, parent: domNode)
        
        return domNode

    }
}
