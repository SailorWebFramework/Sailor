//
//  File.swift
//  
//
//  Created by Joshua Davis on 1/1/24.
//

import JavaScriptKit
import Sailboat

extension SailorManager {
    
    // TODO: problem need parent thing and an element reconcile
    // TODO: make helpers for JSKit stuff and manage all force casting errors
    
    /// current node being reconciled and currently built element
    internal func reconcile(node: any PageNode, element: JSNode) {
        // TODO: logic to reconcile the DOMTree with the Virtual DOM
        print(node, "vs.", element)
        
        if let node = node as? HTMLNode {
//            reconcile(htmlNode: node, element: element)
            element.updateShallow(with: node)
            
            for child in node.children {
                reconcile(node: child, element: element)
            }

        } else if let node = node as? OperatorNode {
            reconcile(operatorNode: node, parent: element)

        } else {
            if let first = node.children.first {
                reconcile(node: first, element: element)
            }
        }
    }
    
//    func reconcile(htmlNode: HTMLNode, element: JSNode) {
//        guard let page = htmlNode.page as? any HTMLElement else { fatalError("page is not HTML Element") }
//        guard let tagName = element.tagName else { fatalError("tagName doesn't exist") }
//
//        let newElement: JSNode
//
//        // TODO: DO THIS IN A HELPER FUNCTION IE: UPDATESHALLOW
//        // check tag if its the same
//        if tagName.uppercased() == page.name.uppercased() {
//            print("RECONCILINGHTMLNODE EQ")
//
//            // if the same modify attributes and events
//            element.updateShallow(with: htmlNode)
//            newElement = element
//
//        } else {
//            print("RECONCILINGHTMLNODE REPL")
//
//            // if different replace element
//            newElement = JSNode(htmlNode)
//            element.replace(with: newElement, using: htmlNode)
//
//        }
//
//        if htmlNode.children.count > 1 { fatalError("HTML element has more than one child") }
//
//        if let firstHTML = htmlNode.children.first {
//            print("RECONCILINGHTMLNODE HAS KID")
//            reconcile(node: firstHTML, element: newElement)
//        }
//
//    }
    
//    func skipUntilHTML() {
//
//    }
    
    // TODO: AMOUNT OF NODES IS NOT DETERMINISTIC AT COMPILE TIME ANYMORE
    // KEEP TRACK OF INDEX IN PARENT AS YOU RECONCILE
    func reconcile(operatorNode: OperatorNode, parent: JSNode) {
        
        // TODO: check id here? managing routing?
        let (newSize, oldSize) = (operatorNode.children.count, Int(parent.children.count))
        
        // operator node counter, and jsnode/element counter
        var (iNode, iElement) = (0, 0)
//        let endIndex = min(newSize, oldSize)
                
        // TODO: CHECK IF ELEMENT HAS A TEXT OR ELEMENTS ie: nodetype 1, or 3
        while iNode < newSize && iElement < oldSize {
            let child = parent.children[iElement]
            let childPageNode = operatorNode.children[iNode]
            
//            if childPageNode is OperatorNode,
//               let first = childPageNode.children.first
//            {
//                reconcile(node: first, element: child)
//
//            } else {
                reconcile(node: childPageNode, element: child)
//            }
            
            iNode += 1
            iElement += 1
        }
 
        // if new and old dom same size , end
        if iNode == newSize && iElement == oldSize {
           return
        }

        // if js dom had more elements than new dom,
        // Removing extra children
        for i in (iElement..<oldSize).reversed() {
            print("REMOVING EXTRA CHILD")
            let child = parent.children[i]
            child.removeFromDOM()
        }

        // if js dom had less elements than new dom, build,
        // Adding extra children
        for i in iNode..<newSize {
            print("BUILDING: \(operatorNode.children[i].description), TO: \(parent.description)")
            parent.appendChildNode(operatorNode.children[i])
        }
    
    }
    
}
