//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/30/23.
//

import Sailboat
import JavaScriptKit

final class SailorManager<WebRoutes: Routes>: DefaultManager {
    
//    internal let documentNode: JSNode = JSNode(elementID: <#ElementID#>)
    
//    internal var buildStatesTempRef: PageNode? = nil
    
    internal var reconcileIndexStack: [Int] = []
    

    override init() {
        super.init()
        self.environment = WebEnvironment<WebRoutes>()
        
    }
    
    private func debugMarker(_ name: String) {
        print(name)
//        body?.printNode()
//        documentNode.printNode()

    }
    
    override public func build<GenericPage: Page>(page: GenericPage) {
        
        // TODO: auto add body if not defined?
        if page is Body {
            super.build(page: page)
        } else {
            super.build(page: Body { page })
        }

    }
    
    override public func update() {
        super.update()
//        reconcile()
//        debugMarker("updated:")

    }
    
    // TODO: logic to reconcile the DOMTree with the Virtual DOM
    private func reconcile() {
//        guard let body = self.body else { return }
//        guard let firstChild = documentNode.children.first else { return }
        
//        reconcile(node: body, element: documentNode)
        
//        reconcile(node: body, element: firstChild)
    }
    
}
