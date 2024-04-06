//
//  Renderable+Build.swift
//
//
//  Created by Joshua Davis on 3/15/24.
//

public extension Renderable {
    
    ///
    internal func build(_ newContent: any Page, after index: Int) -> Int {
//        guard let myElement = SailboatGlobal.manager.managedPages.elements[self.element] else {
//            fatalError("element doesnt exist in global state")
//        }
        
        var newIndex = index
        
        if let newContent = newContent as? any Element {
            
            RenderableUtils.build(newContent)

            if newIndex != -1 {
                newContent.renderer.insertAfter(newIndex, parent: self)
            } else {
                newContent.renderer.insertBefore(0, parent: self)
            }
            
            newIndex += 1
            
        } else if let newContent = newContent as? any Fragment {
            for child in newContent.children {
                newIndex = build(child, after: newIndex)
            }
            
        } else {
            newIndex = build(newContent.body, after: newIndex)
            
        }
        
        return newIndex
    }
    
}
