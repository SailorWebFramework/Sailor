//
//  File.swift
//  
//
//  Created by Joshua Davis on 3/17/24.
//


public enum RenderableUtils {
    
    ///
    public static func build(_ element: any Element) {
        build(page: element, parent: nil)
    }

    /// build a page to this renderer and add it to parent
    public static func build(page: any Page, parent: (any Element)?) {
        // if page is an Operator
        if let page = page as? any Fragment {
            
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
   
}
