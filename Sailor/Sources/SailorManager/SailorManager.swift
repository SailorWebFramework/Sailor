//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/30/23.
//

import Sailboat
import JavaScriptKit

internal typealias SailorGlobal = Sailboat.SailboatGlobal
internal typealias AppManager = Sailboat.AppManager

final class SailorManager: DefaultManager {
    
    internal let documentNode: JSNode = JSNode(element: JSNode.body)

    override public func build(page: any Page) {
        documentNode.reset()

        documentNode.addChild(JSNode())
        
        super.build(page: page)
        reconcile()
        
        documentNode.children.first?.addToDOM()

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
