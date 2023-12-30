//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/29/23.
//

import Foundation
import Sailboat

extension SailboatGlobal {
    public func update() {
        guard let rootNode = SailorGlobal.bodyNode else { return }

        print("DIFFING:")
        print("Starting states:")
        SailboatGlobal.shared.states.printList()

        // diff and update the state
        SailorGlobal.diff(page: rootNode.page, domNode: rootNode)
        
        // debug printing
        SailorGlobal.bodyNode?.printNode()
        SailboatGlobal.shared.states.printList()
    }
}
