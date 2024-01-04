//
//  File.swift
//  
//
//  Created by Joshua Davis on 1/1/24.
//

import JavaScriptKit
import Sailboat

extension SailorManager {
    
    func reconcile(operatorNode: OperatorNode, element: JSNode) {
        guard let page = operatorNode.page as? any Operator else {
            fatalError()
        }
        
        // TODO: check id here? managing routing?
        let (newSize, oldSize) = (operatorNode.children.count, Int(element.children.count))
//        let endRange = min(oldSize, newSize)

        var (iNode, iElement) = (0, 0)
        
        while iNode < newSize && iElement < oldSize {
           let child = element.children[iElement]
           if child.nodeType == 1 {
               reconcile(node: operatorNode.children[iNode], element: child)
               
               iNode += 1
               iElement += 1
           } else {
               iElement += 1
           }
        }

        // if new and old dom same size , end
        if iNode == newSize && iElement == oldSize {
           return
        }

        // if js dom had more elements than new dom, delete
        if iNode >= newSize {
           print("REMOVING EXTRA CHILDREN")
           for i in iElement..<oldSize {
               let child = element.children[i]
               if child.nodeType == 1 {
                   child.removeFromDOM()
               }
           }
        }

        // if js dom had less elements than new dom, build
        if iElement >= oldSize {
            print("ADDING EXTRA CHILDREN")
            for i in iNode..<newSize {
                if let child = operatorNode.children[i] as? HTMLNode {
                    reconcile(
                        htmlNode: child,
                        parent: element
                    )
                } else {
                    reconcile(node: operatorNode.children[i], element: element)
                }
                
//               if operatorNode.children[i] is OperatorNode {
//                   print("Skipping add because operator")
//                   reconcile(node: operatorNode.children[i], element: parent)
//
//               } else {
//                   let newElement: JSNode = JSNode()
//
//                   parent.addChild(newElement)
//
//                   reconcile(node: operatorNode.children[i], element: newElement)
//                   print("ADDED CHILD")
//               }
           }
        }
    }
    
    func reconcile(htmlNode: HTMLNode, parent: JSNode) {
        guard let page = htmlNode.page as? any HTMLElement else {
            fatalError()
        }
        
        let newElement = JSNode(
            named: page.name,
            events: page.events,
            attributes: page.attributes
        )
        
        parent.addChild(newElement)

        if let first = htmlNode.children.first {
            reconcile(node: first, element: newElement)
        }
    }
    
    func reconcile(htmlNode: HTMLNode, element: JSNode) {
        guard let page = htmlNode.page as? any HTMLElement else {
            fatalError()
        }
        
        guard let tagName = element.tagName else {
            print("tagName doesn't exist")
            return
        }
        
        let newElement: JSNode
        
        // check tag if its the same
        if tagName.uppercased() == page.name.uppercased() {
            // if the same modify attributes and events
            element.update(with: htmlNode)
            newElement = element
            
        } else {
            // if different replace element
            newElement = JSNode(named: page.name, events: page.events, attributes: page.attributes)
            element.replace(with: newElement, using: htmlNode)
            
        }

        if let first = htmlNode.children.first {
            reconcile(node: first, element: newElement)
        }
    }
    
    
    // TODO: problem need parent thing and an element reconcile
    // TODO: make helpers for JSKit stuff and manage all force casting errors
    
    /// current node being reconciled and currently built element
    internal func reconcile(node: any PageNode, element: JSNode) {
        // TODO: logic to reconcile the DOMTree with the Virtual DOM
        print(node, "vs.", element)
        
        if let node = node as? HTMLNode {
            reconcile(htmlNode: node, element: element)
            
        } else if let node = node as? OperatorNode {
            reconcile(operatorNode: node, element: element)
            
        } else {
            if let first = node.children.first {
                reconcile(node: first, element: element)
            }
        }
    }
    
}
