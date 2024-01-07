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
            reconcile(htmlNode: node, element: element)

        } else if let node = node as? OperatorNode {
            reconcile(operatorNode: node, parent: element)

        } else {
            if let first = node.children.first {
                reconcile(node: first, element: element)

//                reconcile(node: first, parent: element)
            }
        }
    }
    
    func create(htmlNode: HTMLNode, parent: JSNode) {
        print("CREATING NEW ELEMENT")
        let newElement = JSNode(htmlNode)
        
        parent.addChild(newElement)

        self.documentNode.printNode()

        if let first = htmlNode.children.first {
            reconcile(node: first, element: newElement)
        }
    }
    
    func appendChildren(pagenode: any PageNode, onto parent: JSNode) {
        if let htmlChild = pagenode as? HTMLNode {
            create(htmlNode: htmlChild, parent: parent)
            return
        }
        
        for i in 0..<pagenode.children.count {
            appendChildren(pagenode: pagenode.children[i], onto: parent)
        }
    }
    
    func reconcile(htmlNode: HTMLNode, element: JSNode) {
        guard let page = htmlNode.page as? any HTMLElement else { fatalError() }
        guard let tagName = element.tagName else { fatalError("tagName doesn't exist") }
        
        let newElement: JSNode
        
        // check tag if its the same
        if tagName.uppercased() == page.name.uppercased() {
            // if the same modify attributes and events
            element.update(with: htmlNode)
            newElement = element
            
        } else {
            // if different replace element
            newElement = JSNode(htmlNode)
            element.replace(with: newElement, using: htmlNode)
            
        }
        
        self.documentNode.printNode()

        if let firstHTML = htmlNode.children.first {
            reconcile(node: firstHTML, element: newElement)
        }
        
    }
    
    func reconcile(operatorNode: OperatorNode, parent: JSNode) {
//        guard let page = operatorNode.page as? any Operator else {
//            fatalError()
//        }
        
        // TODO: check id here? managing routing?
        let (newSize, oldSize) = (operatorNode.children.count, Int(parent.children.count))
        
        //operator node counter, and jsnode/element counter
        var (iNode, iElement) = (0, 0)
//        let endIndex = min(newSize, oldSize)
                
        while iNode < newSize && iElement < oldSize {
            let child = parent.children[iElement]
            if child.nodeType == 1 {
                print("REUSING OLD NODE THING")
                reconcile(node: operatorNode.children[iNode], element: child)
                iNode += 1
                iElement += 1
            } else {
                print("NODE TYPE IS BAD")
                iElement += 1
            }
        }
        
//        for i in 0..<endIndex {
//            let child = parent.children[i]
//
////            if operatorNode.children[iNode] is HTMLNode {
////                iIndex += 1
////            }
//            reconcile(node: operatorNode.children[i], element: child)
//
//        }
//        while iNode < operatorNode.children.count {
//           let child = element.children[iElement]
//           reconcile(node: operatorNode.children[iNode], element: child)
//
//           iNode += 1
//        }

        // if new and old dom same size , end
        if iNode == newSize && iElement == oldSize {
           return
        }

        // if js dom had more elements than new dom, delete
        for i in (iElement..<oldSize).reversed() {
            print("REMOVING EXTRA CHILD")
            let child = parent.children[i]
            if child.nodeType == 1 {
                child.removeFromDOM()
            }
        }

        // if js dom had less elements than new dom, build
        for i in iNode..<newSize {
            print("ADDING EXTRA CHILD \(i)")
            appendChildren(pagenode: operatorNode.children[i], onto: parent)
//            reconcile(node: , parent: parent)
        }
    }
    
}
