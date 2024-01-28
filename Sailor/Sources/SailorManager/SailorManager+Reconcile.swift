//
//  File.swift
//  
//
//  Created by Joshua Davis on 1/1/24.
//

import JavaScriptKit
import Sailboat

extension SailorManager {
    
    /// current node being reconciled and currently built element
    internal func reconcile(node: any PageNode, element: JSNode) {
        // TODO: logic to reconcile the DOMTree with the Virtual DOM
        print(node, "vs.", element)
        
        if let node = node as? HTMLNode {
            reconcile(htmlNode: node, element: element)

        } else if let node = node as? OperatorNode {
            reconcile(operatorNode: node, parent: element)

        } else {
            if let first = node.children.first {
                reconcile(node: first, element: element)
            }
        }
    }
    
    func reconcile(htmlNode: HTMLNode, element: JSNode) {

        // update the HTML element shallowly
        element.updateShallow(with: htmlNode)
        
        documentNode.printNode()
        print("children \(htmlNode.children.count)")

        
        // create a sub-stack
        reconcileIndexStack.append(0)

        // loop over the children
        for child in htmlNode.children {
            reconcile(node: child, element: element)
        }
        
        let value = reconcileIndexStack.popLast()
        
        print("STACK @\(htmlNode): \(reconcileIndexStack)")
        
//        assert(
//            (value!) == htmlNode.children.count,
//            "HTMLNODE DIDNT ADD ENOUGH ELEMENTS, \((value!)):\(htmlNode.children.count)"
//        )
    }

    // TODO: AMOUNT OF NODES IS NOT DETERMINISTIC AT COMPILE TIME ANYMORE
    // TODO: check id here? managing routing?
    // KEEP TRACK OF INDEX IN PARENT AS YOU RECONCILE
    func reconcile(operatorNode: OperatorNode, parent: JSNode) {
        let (newSize, oldSize) = (operatorNode.children.count, Int(parent.children.count))
        let endIndex = min(newSize, oldSize)
        
        // operator node counter, and jsnode/element counter
        var index: Int = 0
        var indexParent: Int { reconcileIndexStack.last! }
                 
        // TODO: CHECK IF ELEMENT HAS A TEXT OR ELEMENTS ie: nodetype 1, or 3
        while index < endIndex && indexParent < endIndex {
            let child = parent.children[indexParent]
            let childPageNode = operatorNode.children[index]
            
            reconcile(node: childPageNode, element: child)
            
            // add 1 to parent reconcile stack
            reconcileIndexStack[reconcileIndexStack.count - 1] += 1
            
            // add 1 to operator node counter
            index += 1
        }
        
        print("INDICES-> i:\(index) , pi: \(indexParent) -> old: \(oldSize)" )
        
        // if js dom had more elements than new dom,
        // Removing extra children
        for i in (indexParent..<oldSize).reversed() {
            print("REMOVING \(i)")
            let child = parent.children[i]
            child.removeFromDOM()
        }

        // if js dom had less elements than new dom, build,
        // Adding extra children
        for i in index..<newSize {
            print("BUILDING: \(operatorNode.children[i].description), TO: \(parent.description)")
            parent.appendChildNode(operatorNode.children[i])
        }
    
        documentNode.printNode()

    }
    
}
