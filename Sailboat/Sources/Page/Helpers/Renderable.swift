//
//  Renderable.swift
//  
//
//  Created by Joshua Davis on 3/8/24.
//

import Foundation

public protocol Renderable {

    func addToParent(_ parentNode: any Renderable)

    func addChild(_ childNode: any Renderable)

    func remove()
    
    func replace(with renderable: any Renderable)
    
    func render(page: any Element)
    
    func updateAttribute(name: String, value: String)
    
//    func build(page: any Page)
    
    // TODO: reRenderBody ?
    
    // TODO: renderText
    
//    func addEvent(name: String, closure: @escaping (EventResult) -> Void)
    
    func debugPrint()
}

extension Renderable {
    func build(page: any Page) {
        
        // if page is an Operator
        if let page = page as? any Operator {
            
            // add children
            for child in page.children {
                build(page: child)
            }
            
            return
        }
        
        // if page is an HTMLElement
        if let page = page as? any Element {
            
            // add parent to the stack and change to us as new parent
            let myParent = SailboatGlobal.manager.managedPage.parentElement
            
            SailboatGlobal.manager.managedPage.parentElement = page
            
            // run the page builder closure to create an operator node
            if let listpage = page.content {
                let operatorPage = listpage()
                
                //only save pages with associated state,
                //TODO: also remove them when they go out of scope
                //TODO: consider putting this on onAppear and onDisappear
                if !SailboatGlobal.manager.stateCallbackHistory.isEmpty {
                    SailboatGlobal.manager.elements[page.id] = page
                }
                
                SailboatGlobal.manager.dumpTo(element: page, toBody: true)
                
                build(page: operatorPage)
            }

            // restore parent
            SailboatGlobal.manager.managedPage.parentElement = myParent
            
            // render current page to parent
            if let managedParentElement = SailboatGlobal.manager.managedPage.parentElement {
                page.renderer.render(page: page)
                page.renderer.addToParent(managedParentElement.renderer)
                
            }

            return

        }
        
        build(page: page.body)
        
    }
}
