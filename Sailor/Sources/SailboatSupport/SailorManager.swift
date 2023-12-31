//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/30/23.
//

import Foundation
import Sailboat
import JavaScriptKit

public class SailorManager: DefaultManager {
    
    public let document = JSObject.global.document.object

    override public func build(page: any Page) {
        super.build(page: page)
        reconcile()
    }
    
    override public func update() {
        super.update()
        reconcile()
    }
    
    // TODO: logic to reconcile the DOMTree with the Virtual DOM
    private func reconcile() {
        guard let body = self.body else { return }
        guard let document = self.document else { return }

        reconcile(node: body, parent: document)
    }
    
    private func reconcile(node: any PageNode, parent: JSObject) {
        // TODO: logic to reconcile the DOMTree with the Virtual DOM
        
    }
    
}
