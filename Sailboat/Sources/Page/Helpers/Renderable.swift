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
            if let listpage = page.content {
                let operatorPage = listpage()
                
                //only save pages with associated state,
                //TODO: also remove them when they go out of scope
                //TODO: consider putting this on onAppear and onDisappear
                if !SailboatGlobal.manager.stateCallbackHistory.isEmpty {
                    SailboatGlobal.manager.elements[page.id] = page
                }
                
                SailboatGlobal.manager.dumpTo(element: page)
                
                build(page: operatorPage, parent: page)
            }
            
            // render current page to parent
            page.renderer.render(page: page)
            
            if let parent = parent {
                page.renderer.addToParent(parent.renderer)
            }

            return

        }
        
        build(page: page.body, parent: parent)
    }
}
