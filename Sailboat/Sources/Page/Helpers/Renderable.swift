//
//  Renderable.swift
//  
//
//  Created by Joshua Davis on 3/8/24.
//

import Foundation

public protocol Renderable {

    /// add this element to the parent element
    func addToParent(_ parent: any Element)
    
    /// add this element below another element
    func addBelow(_ node: any Element)
    
    /// remove this element permenately
    func remove()
    
    /// remove all attributes
    func clearAttributes()
    
    /// remove all events
    func clearEvents()

    /// remove the children elements from being rendered
    func clearBody()
    
    /// diff and reconcile and rebuild the body of the current element
    func reconcile(with operator: any Operator)
    
    /// diff and replace attributes
//    func diffAttribuets()
    
    // TODO: maybe rename to shallow render?
    /// replace this node with another element
    func replace(with renderable: any Element)
    
    /// shallow render of an element
    func render()
    
    /// update the specified attribute
    func updateAttribute(name: String, value: String)
    
}

public extension Renderable {
    
    /// build a page to this renderer and add it to parent
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
            let operatorPage = page.content()

            //TODO: also remove them when they go out of scope, also only save pages with state?
//          if !SailboatGlobal.manager.stateCallbackHistory.isEmpty { }
            SailboatGlobal.manager.managedPages.elements[page.id] = page
            SailboatGlobal.manager.managedPages.children[page.id] = operatorPage

            SailboatGlobal.manager.dumpTo(element: page)
            
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
