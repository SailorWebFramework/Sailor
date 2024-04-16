//
//  File.swift
//  
//
//  Created by Joshua Davis on 3/17/24.
//


public enum RenderableUtils {
    
    //TODO: remove? and just use the other build function with =nil default value
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
            
            // render current page to parent
            page.renderer.renderAttributes(page.attributes)
            page.renderer.renderEvents(page.events)

            build(page: operatorPage, parent: page)
            
            if let parent = parent {
                page.renderer.addToParent(parent.renderer)
            }
            
            return
        }
        
        build(page: page.body, parent: parent)
        
    }
    
    public static func removeCache(with sailboatID: SailboatID) {
        print("REMOVING \(sailboatID)")
        SailboatGlobal.managedPages.bodies[sailboatID] = nil
        SailboatGlobal.managedPages.children[sailboatID] = nil
        SailboatGlobal.managedPages.renderers[sailboatID] = nil
        
        // TODO: must loop over, make this more efficient

        for stateID in SailboatGlobal.managedPages.attributes.keys {
            SailboatGlobal.managedPages.attributes[stateID] = SailboatGlobal.managedPages.attributes[stateID]?.filter {
                $0.sid != sailboatID
            }
        }
        
        for stateID in SailboatGlobal.managedPages.statefulElements.keys {
            SailboatGlobal.managedPages.statefulElements[stateID]?.remove(sailboatID)
        }
        
    }
   
}
