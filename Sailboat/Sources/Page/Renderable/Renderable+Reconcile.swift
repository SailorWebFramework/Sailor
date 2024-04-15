//
//  Renderable+Reconcile.swift
//
//
//  Created by Joshua Davis on 3/15/24.
//

public extension Renderable {
    
    /// reconciles the current node with the body of newContent
    func reconcile(with newContent: any Fragment) {
        
        guard let sid = self.sid, let oldContent = SailboatGlobal.manager.managedPages.children[sid] else {
            fatalError("old content doesnt exist or is stateless")
        }
        
        guard type(of: newContent) == type(of: oldContent) else {
            fatalError("reconciling two different node types")
        }
        
        var copyOfNewContent = newContent
        
        _ = reconcileBody(oldList: oldContent, newList: &copyOfNewContent, index: -1)
        
        SailboatGlobal.manager.managedPages.children[sid] = copyOfNewContent
        
    }
    
    private func reconcileBody(oldList: any Fragment, newList: inout any Fragment, index deepindex: Int) -> Int {
        guard oldList.children.count == newList.children.count else {
            fatalError("TWO OPERATORS SHOULD NOT HAVE SAME HASH AND DIFFERENT AMOUNT OF ELEMENTS")
        }

        let elementCount = oldList.children.count
                
        var deepindex = deepindex
                
        for i in 0..<elementCount {
            if let oldElement = oldList.children[i] as? any Element {
                deepindex += 1
                
                // keeps the old renderer, or replaces a value-element ex: String
                if let newChild = newList.children[i] as? any ValueElement {
                    self.replace(at: deepindex, with: newChild.renderer)
                } else {
                    newList.children[i] = oldElement
                }
                
                continue
            }
            
            if let oldOp = oldList.children[i] as? any Fragment,
               var newOp = newList.children[i] as? any Fragment {
                                
                // check if the list hash is the same
                if oldOp.hash == newOp.hash {
                    deepindex = reconcileBody(oldList: oldOp, newList: &newOp, index: deepindex)
                } else {
                    // clear and build new children if hash differs
                    // TODO: instead of clear children and rebuild consider diffing
                    // This will allow SwiftUI-like libraries to be able to function correctly
                    // this is because Sailor uses closures for data but swiftUI doesnt
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
    
    private func clearChildren(from content: any Fragment, at index: Int) {
//        guard let myPage = SailboatGlobal.manager.managedPages.elements[self.id] else {
//            fatalError("old content doesnt exist or is stateless")
//        }
        
        for child in content.children {
            
            if let child = child as? any Element {
                child.renderer.remove()
                
                continue
            }
            
            if let child = child as? any Fragment {
                clearChildren(from: child, at: index)
                
                continue
            }
            
            // custom node here? wtf is the parent
            self.remove(at: index + 1)
            
            // TODO:
            // Problem.. what happens to custom pages the elements arent loaded
            // remove the element when rendered.
            // Custom node must neccisarily have one child
            // child.body

        }
    }
}
