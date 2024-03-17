//
//  Renderable+Reconcile.swift
//
//
//  Created by Joshua Davis on 3/15/24.
//

public extension Renderable {
    
    /// reconciles the current node with the body of newContent
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

        _ = reconcileBody(oldList: oldContent, newList: &copyOfNewContent, index: -1)
        
        SailboatGlobal.manager.managedPages.children[self.elementID] = copyOfNewContent
        
        print("COPYCOPY")
        copyOfNewContent.printPage()
    }
    
    
    private func reconcileBody(oldList: any Operator, newList: inout any Operator, index deepindex: Int) -> Int {
        guard oldList.children.count == newList.children.count else {
            fatalError("TWO OPERATORS SHOULD NOT HAVE SAME HASH AND DIFFERENT AMOUNT OF ELEMENTS")
        }

        let elementCount = oldList.children.count
                
        var deepindex = deepindex
                
        for i in 0..<elementCount {
            if let oldElement = oldList.children[i] as? any Element {
                deepindex += 1
                
                print(oldElement.description)

                // keeps the old renderer, or replaces a value-element ex: String
                if let newChild = newList.children[i] as? any ValueElement {
                    self.replace(at: deepindex, with: newChild)
                } else {
                    newList.children[i] = oldElement
                }
                
                continue
            }
            
            if let oldOp = oldList.children[i] as? any Operator,
               var newOp = newList.children[i] as? any Operator {
                
                print(oldOp.hash, "==", newOp.hash, "?")
                
                if oldOp.hash == newOp.hash {
                    deepindex = reconcileBody(oldList: oldOp, newList: &newOp, index: deepindex)
                } else {
                    clearChildren(from: oldOp, at: deepindex)
                    deepindex = build(newOp, after: deepindex)
                }
                
                // sets the old inner list with the new one
                newList.children[i] = newOp
                
                continue
            }
            
            // if custom node skip it and add 1 to the deep index
            deepindex += 1
            
        }
        
        return deepindex
    }
    
    // TODO: do i need this?
    private func clearChildren(from content: any Operator, at index: Int) {
        guard let myPage = SailboatGlobal.manager.managedPages.elements[self.elementID] else {
            fatalError("old content doesnt exist or is stateless")
        }
        
        for child in content.children {
            
            if let child = child as? any Element {
                child.renderer.remove()
                
                continue
            }
            
            if let child = child as? any Operator {
                clearChildren(from: child, at: index)
                
                continue
            }
            
            // TODO: custom node here? wtf is the parent
            myPage.renderer.remove(at: index + 1)


//            clearChildren(from: child)
            
            // TODO:
            // Problem.. what happens to custom pages the elements arent loaded
            // remove the element when rendered.
            // Custom node must neccisarily have one child
            // child.body

        }
    }
    
}
