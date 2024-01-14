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

final class SailorManager: DefaultManager {
    
    internal let documentNode: JSNode = JSNode(element: JSNode.body)

    override public func build(page: any Page) {
        documentNode.reset()

        documentNode.addChild(JSNode())
                
        super.build(page: page)
        reconcile()
        
        documentNode.children.first?.addToDOM()
        
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
    
    override public func update() {
        print("UPDATING...")
        super.update()
        reconcile()
        
        body?.printNode()
        documentNode.printNode()

    }
    
    // TODO: logic to reconcile the DOMTree with the Virtual DOM
    private func reconcile() {
        guard let body = self.body else { return }
        guard let firstChild = documentNode.children.first else { return }
        
        print("START RECONCILING...")
        reconcile(node: body, element: firstChild)
        
        body.printNode()
        documentNode.printNode()
        
    }
    
}
