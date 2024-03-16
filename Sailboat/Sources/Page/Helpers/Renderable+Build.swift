//
//  Renderable+Build.swift
//
//
//  Created by Joshua Davis on 3/15/24.
//

public extension Renderable {

    /// build a page to this renderer and add it to parent
    func build(page: any Page, parent: (any Element)?)  -> (any Element)? {
        // if page is an Operator
        if let page = page as? any Operator {
            
            var last: (any Element)? = nil
            // add children
            for child in page.children {
                let element = build(page: child, parent: parent)
                
                if element != nil {
                    last = element
                }
            }
            
            return last
        }
        
        // if page is an HTMLElement
        if let page = page as? any Element {
            
            // run the page builder closure to create an operator node
            let operatorPage = page.content()
            
            //TODO: also remove them when they go out of scope, also only save pages with state?
            SailboatGlobal.manager.managedPages.elements[page.id] = page
            
            if !SailboatGlobal.manager.managedPages.stateHistory.isEmpty {
                SailboatGlobal.manager.managedPages.children[page.id] = operatorPage
            }
            
            SailboatGlobal.manager.dumpTo(element: page)
            
            // TODO: dis broke or som
            let bottomPage = build(page: operatorPage, parent: page)
            
            // render current page to parent
            page.renderer.render()
            
            if let parent = parent {
                page.renderer.addToParent(parent)
            }
            
            return bottomPage
        }
        
        return build(page: page.body, parent: parent)
    }
  
    func reconcile(with newContent: any Operator) {
        guard let oldContent = SailboatGlobal.manager.managedPages.children[self.elementID] else {
            fatalError("old content doesnt exist or is stateless")
        }
        
        guard type(of: newContent) == type(of: oldContent) else {
            fatalError("reconciling two different node types")
        }
        
        var copyOfNewContent = newContent
        
        print("reconciling \(newContent)")
        print(newContent.children)

        reconcileBody(oldList: oldContent, newList: &copyOfNewContent)
        
        //ISSUE
        SailboatGlobal.manager.managedPages.children[self.elementID] = copyOfNewContent
    }
    
    
    private func reconcileBody(oldList: any Operator, newList: inout any Operator) {
        guard oldList.children.count == newList.children.count else {
            fatalError("TWO OPERATORS SHOULD NOT HAVE SAME HASH AND DIFFERENT AMOUNT OF ELEMENTS")
        }

        let elementCount = oldList.children.count
        
        var aboveElement: (any Element)? = nil
                
        for i in 0..<elementCount {
            if let oldElement = oldList.children[i] as? any Element {
                print(oldElement.description)
                // TODO: the index is not correct for past conditionals
                if let newChild = newList.children[i] as? any ValueElement {
                    print("replacing with \(newChild)")
                    self.replace(at: i, with: newChild)
                } else {
                    // keeps the old renderer, marks the element as the currently last rendered in Page
                    aboveElement = oldElement
                    newList.children[i] = oldElement
                }
            }
            
            if let oldOp = oldList.children[i] as? any Operator,
               var newOp = newList.children[i] as? any Operator {
                
                print(oldOp.hash, "==", newOp.hash, "?")
                
                if oldOp.hash == newOp.hash {
                    reconcileBody(oldList: oldOp, newList: &newOp)
                } else {
                    
                    clearChildren(from: oldOp)
                    
                    aboveElement = build(newOp, under: aboveElement)
                    
                    // TODO: save element value after rebuild
                }
                
                // sets the old inner list with the new one
                newList.children[i] = newOp
                
            }
        }
    }
    
    private func clearChildren(from content: any Operator) {
        for child in content.children {
            
            if let child = child as? any Element {
                child.renderer.remove()
                return
            }
            
            if let child = child as? any Operator {
                clearChildren(from: child)
                return
            }
            
            
            // TODO:
            // Problem.. what happens to custom pages the elements arent loaded
            // remove the element when rendered.
            // Custom node must neccisarily have one child
            // child.body

        }
    }
    
    
    ///
    private func build(_ newContent: any Operator, after index: Int) -> Int {
        var newIndex: Int = index
        for child in newContent.children {
            if let child = child as? any Element {
                if index != -1 {
                    child.renderer.build(page: child, parent: nil)
                    child.renderer.addBelow(newIndex)

                } else {
                    if let myElement = SailboatGlobal.manager.managedPages.elements[self.elementID] {
                        child.renderer.build(page: child, parent: nil)
                        child.renderer.addToParent(myElement)

                    } else {
                        fatalError("element doesnt exist in global state")
                    }

                }
                
                newIndex += 1

//                if let above = above {
//                    child.renderer.build(page: child, parent: nil)
//                    child.renderer.addBelow(above)
//                    
//                } else {
//                    if let myElement = SailboatGlobal.manager.managedPages.elements[self.elementID] {
//                        child.renderer.build(page: child, parent: nil)
//                        child.renderer.addToParent(myElement)
//                        
//                    } else {
//                        fatalError("element doesnt exist in global state")
//                    }
//                
//                }
//                
//                if !(child is any ValueElement) {
//                    above = child
//                }
                
                continue
            }
            
            if let child = child as? any Operator {
                newIndex = build(child, after: newIndex)
                continue
            }
            
//            above.renderer.removeBelow()
            
            // TODO: custom nodes
        }
        return newIndex
    }
    
    ///
    private func build(_ newContent: any Operator, under aboveElement: (any Element)?) -> (any Element)? {
        var above: (any Element)? = aboveElement
        for child in newContent.children {
            if let child = child as? any Element {
                if let above = above {
                    child.renderer.build(page: child, parent: nil)
                    child.renderer.addBelow(above)
                    
                } else {
                    if let myElement = SailboatGlobal.manager.managedPages.elements[self.elementID] {
                        child.renderer.build(page: child, parent: nil)
                        child.renderer.addToParent(myElement)
                        
                    } else {
                        fatalError("element doesnt exist in global state")
                    }
                
                }
                
                if !(child is any ValueElement) {
                    above = child
                }
                continue
            }
            
            if let child = child as? any Operator {
                above = build(child, under: above)
                continue
            }
            
//            above.renderer.removeBelow()
            
            // TODO: custom nodes
        }
        return above
    }
    
}
