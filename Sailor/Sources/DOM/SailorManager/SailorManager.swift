//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/30/23.
//

import Sailboat
import JavaScriptKit

internal typealias SailorGlobal = Sailboat.SailboatGlobal
internal typealias TargetManager = Sailboat.TargetManager

//extension SailorGlobal {
//    var sailorManager: SailorManager {
//        Self.manager as! SailorManager
//    }
//}

//extension SailorGlobal {
//    var sailorEnvironment: WebEnvironment<MyRoutes> {
//        self.environment as! WebEnvironment<MyRoutes>
//    }
//
//    var sailorManager: SailorManager<MyRoutes> {
//
//    }
//}

final class SailorManager<WebRoutes: Routes>: DefaultManager {
    
    internal let documentNode: JSNode = JSNode(root: true)
    
//    internal var buildStatesTempRef: PageNode? = nil
    internal var reconcileIndexStack: [Int] = []
    
    override init() {
        super.init()
        self.environment = WebEnvironment<WebRoutes>()
        
    }
    
    override public func build<GenericPage: Page>(page: GenericPage) {
        debugMarker("START BUILD...")

        documentNode.reset()
        documentNode.addChild(JSNode())
                
        super.build(page: page)
        reconcile()
                
        debugMarker("END BUILD...")

        // TODO: addds global css file?
//        // Create a new link element
//        let link = JSNode.document.createElement("link").object!
//        link.rel = "stylesheet"
//        link.type = "text/css"
//        link.href = "/Resources/Global.css"  // Replace with the correct path
//
//        // Append the link element to the head
//        JSNode.head.appendChild!(link)

    }
    
    func debugMarker(_ name: String) {
        print(name)
        body?.printNode()
        documentNode.printNode()

    }
    
    override public func update() {
        debugMarker("START UPDATING...")
        
        super.update()
        reconcile()
        
        debugMarker("END UPDATING...")

    }
    
    // TODO: logic to reconcile the DOMTree with the Virtual DOM
    private func reconcile() {
        debugMarker("START RECONCILE...")

        guard let body = self.body else { return }
        guard let firstChild = documentNode.children.first else { return }
        
        reconcile(node: body, element: firstChild)
        
        debugMarker("END RECONCILE...")

    }
    
}
