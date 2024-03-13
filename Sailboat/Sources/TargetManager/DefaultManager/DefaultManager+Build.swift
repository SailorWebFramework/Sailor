//
//  DefaultManager+Build.swift
//  
//
//  Created by Joshua Davis on 2/2/24.
//

public extension DefaultManager {
    
    internal func initialBuild(page: any Page) {
        if let page = page as? any Operator {

            // add children
            for child in page.children {
                initialBuild(page: child)
            }

            return
        }
        
        if let page = page as? any Element {
            page.renderer.build(page: page, parent: nil)
            return
        }

        initialBuild(page: page.body)

    }

}


//    func build(page: any Page) {
//
//        // if page is an Operator
//        if let page = page as? any Operator {
//
//            // add children
//            for child in page.children {
//                build(page: child)
//            }
//
//            return
//        }
//
//        // if page is an HTMLElement
//        if let page = page as? any Element {
//
//            // add parent to the stack and change to us as new parent
//            let myParent = self.managedPage.parentElement
//
//            self.managedPage.parentElement = page
//
//            // run the page builder closure to create an operator node
//            if case let .list(listpage) = page.content {
//                let operatorPage = listpage()
//
//                //only save pages with associated state,
//                //TODO: also remove them when they go out of scope
//                //TODO: consider putting this on onAppear and onDisappear
//                if !stateCallbackHistory.isEmpty {
//                    self.elements[page.id] = page
//                }
//
//                self.dumpTo(element: page, toBody: true)
//
//                build(page: operatorPage)
//            }
//
//            // restore parent
//            self.managedPage.parentElement = myParent
//
//            // render current page to parent
//            if let managedParentElement = self.managedPage.parentElement {
//                page.renderer.render(page: page)
//                page.renderer.addToParent(managedParentElement.renderer)
//
//            }
//
//            return
//
//        }
//
//        build(page: page.body)
//
//    }

//    func build(page: any Page, parent: (any PageNode)?) -> any PageNode {
//
//        // if page is an Operator
//        if let page = page as? any Operator {
//
//            // if parent was just called with makelist() remember dependencies
//            if let page = parent?.page as? any Element {
//                self.dumpTo(element: page, toBody: true)
//            }
//
//            // create new virtual dom node
//            let domNode = OperatorNode(
//                page: page,
//                parent: parent
//            )
//
//            // add new node as a child of the current parent
//            parent?.append(domNode)
//
//            // add children
//            for child in page.children {
//                _ = build(page: child, parent: domNode)
//            }
//
//            return domNode
//        }
//
//        // if page is an HTMLElement
//        if let page = page as? any Element {
//
//            // create new virtual dom node
//            let domNode = ElementNode(
//                page: page,
//                parent: parent
//            )
//
//            // add new node as a child of the current parent
//            parent?.append(domNode)
//
//            // add parent to the stack and change to us as new parent
//            let myParent = self.managedPage.parentElement
//
//            self.managedPage.parentElement = page
//
//            // run the page builder closure to create an operator node
//            if case let .list(listpage) = page.content {
//                _ = build(page: listpage(), parent: domNode)
//            }
//
//            // restore parent
//            self.managedPage.parentElement = myParent
//
//            // render current page to parent
//            if let managedParentElement = (self.managedPage.parentElement as? any Element) {
//                page.renderer.render(page: page)
//                page.renderer.addToParent(managedParentElement.renderer)
//
//                //TODO: only save pages with associated state, also remove them when they go out of scope
//                self.elements[page.id] = page
////                managedParentElement.renderer.debugPrint()
//            }
//
//            return domNode
//
//        }
//
//        // if page is a custom page
//        let domNode = CustomNode(
//            page: page,
//            parent: parent
//        )
//
////        self.registerPageNode(domNode)
//
//        parent?.append(domNode)
//        _ = build(page: page.body, parent: domNode)
//
//        return domNode
//
//    }
