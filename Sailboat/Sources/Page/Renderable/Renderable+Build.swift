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
            
            SailboatGlobal.managedPages.registerElement(page, operatorPage)
            
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
    internal func build(_ newContent: any Page, after index: Int) -> Int {
        guard let myElement = SailboatGlobal.manager.managedPages.elements[self.elementID] else {
            fatalError("element doesnt exist in global state")
        }
        
        var newIndex = index
        
        if let newContent = newContent as? any Element {
            
            newContent.renderer.build(newContent)

            if newIndex != -1 {
                newContent.renderer.insertAfter(newIndex, parent: myElement)
            } else {
                newContent.renderer.insertBefore(0, parent: myElement)
            }
            
            newIndex += 1
            
        } else if let newContent = newContent as? any Operator {
            for child in newContent.children {
                newIndex = build(child, after: newIndex)
            }
            
        } else {
            newIndex = build(newContent.body, after: newIndex)
            
        }
        
        return newIndex
    }
    
}
