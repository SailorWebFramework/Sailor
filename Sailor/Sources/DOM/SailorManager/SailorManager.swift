//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/30/23.
//

import Sailboat
import JavaScriptKit

final class SailorManager<WebRoutes: Routes>: DefaultManager {
    
    internal let documentNode: JSNode = JSNode(root: true)
    
//    internal var buildStatesTempRef: PageNode? = nil
    
    internal var reconcileIndexStack: [Int] = []
    
    override init() {
        super.init()
        self.environment = WebEnvironment<WebRoutes>()
        
    }
    
    private func debugMarker(_ name: String) {
        print(name)
        body?.printNode()
        documentNode.printNode()

    }
    
    override public func build<GenericPage: Page>(page: GenericPage) {
        documentNode.reset()
 
        super.build(page: page)
        
        // If the user didnt specify a body add this element in implicitly
        if !(page is Body) {
            let bodyElement = ElementNode(page: Body { List { page } }, parent: nil)
            let operatorElement = OperatorNode(page: List { page }, parent: nil)
            
            operatorElement.append(self.body!)
            bodyElement.append(operatorElement)

            self.body = bodyElement
        }
        
        reconcile()
        
//        debugMarker("Built:")
    }
    
    override public func update() {
        super.update()
        reconcile()
//        debugMarker("updated:")

    }
    
    // TODO: logic to reconcile the DOMTree with the Virtual DOM
    private func reconcile() {
        guard let body = self.body else { return }
//        guard let firstChild = documentNode.children.first else { return }
        
        reconcile(node: body, element: documentNode)
        
//        reconcile(node: body, element: firstChild)
    }
    
}
