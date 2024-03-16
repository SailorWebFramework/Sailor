//
//  Renderable+Build.swift
//
//
//  Created by Joshua Davis on 3/15/24.
//

public extension Renderable {
    
    ///
    func build(_ element: any Element) {
        build(page: element, parent: nil)
    }

    /// build a page to this renderer and add it to parent
    private func build(page: any Page, parent: (any Element)?) {
        // if page is an Operator
        if let page = page as? any Operator {
            
            // add children
            for child in page.children {
                build(page: child, parent: parent)
            }
            
            return
        }
        
        // if page is an HTMLElement
        if let page = page as? any Element {
            
            // run the page builder closure to create an operator node
            let operatorPage = page.content()
            
            // TODO: make helper func registerNewPage?
            SailboatGlobal.manager.managedPages.elements[page.id] = page
            
            if !SailboatGlobal.manager.managedPages.stateHistory.isEmpty {
                SailboatGlobal.manager.managedPages.children[page.id] = operatorPage
            }
            
            SailboatGlobal.manager.dumpTo(element: page)
            
            build(page: operatorPage, parent: page)
            
            // render current page to parent
            page.renderer.render()
            
            if let parent = parent {
                page.renderer.addToParent(parent)
            }
            
            return
        }
        
        build(page: page.body, parent: parent)
        
    }
    
    ///
    internal func build(_ newContent: any Operator, after index: Int) -> Int {
        var newIndex: Int = index
        for child in newContent.children {
            if let child = child as? any Element {
                guard let myElement = SailboatGlobal.manager.managedPages.elements[self.elementID] else {
                    fatalError("element doesnt exist in global state")
                }
                    
                newIndex += 1

                child.renderer.build(child)
                child.renderer.addBelow(newIndex, parent: myElement)

                
//                if index != -1 {
//                    child.renderer.addBelow(newIndex, parent: myElement)
//                } else {
//                    // TODO: this is wrong?, actually i dont think this is possible?
//                    child.renderer.addAbove(newIndex, parent: myElement)
//                }

//                newIndex += 1

                continue
            }
            
            if let child = child as? any Operator {
                newIndex = build(child, after: newIndex)
                continue
            }
                        
            // TODO: custom nodes
        }
        return newIndex
    }
    
    
}
