//
//  Renderable.swift
//  
//
//  Created by Joshua Davis on 3/8/24.
//

import Foundation

public protocol Renderable {

    func addToParent(_ parentNode: any Element)

//    func addChild(_ childNode: any Element)

    func remove()
    
    func clear()
    
    func replace(with renderable: any Element)
    
    func render()
    
    func updateAttribute(name: String, value: String)
    
    func debugPrint()
}

extension Renderable {
    func build(page: any Page, parent: (any Element)?) {
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
//            if let listpage = page.content {
//                let operatorPage = listpage()
            let operatorPage = page.content()

            if !operatorPage.children.isEmpty {
            
                //only save pages with associated state,
                //TODO: also remove them when they go out of scope
//                if !SailboatGlobal.manager.stateCallbackHistory.isEmpty { }
                SailboatGlobal.manager.managedPages.elements[page.id] = page
                
                SailboatGlobal.manager.dumpTo(element: page)
                
                build(page: operatorPage, parent: page)
//            }
            }

            print("PAGE:\(page)")

            print("PRINT A RENDER")
            // render current page to parent
            page.renderer.render()
            
            print("WE RENDERRR")

            if let parent = parent {
                page.renderer.addToParent(parent)
            }

            return

        }
        
        build(page: page.body, parent: parent)
    }
}
