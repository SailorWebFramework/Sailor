//
//  File.swift
//  
//
//  Created by Joshua Davis on 1/1/24.
//

import JavaScriptKit
import Sailboat

extension SailorManager {
    
//    /// current node being reconciled and currently built element
//    internal func reconcile(node: any PageNode, element: JSNode) {
////        print(node.description, "vs.", element.description)
//        
//        if let node = node as? ElementNode {
//            reconcile(htmlNode: node, element: element)
//
//        } else if let node = node as? OperatorNode {
//            reconcile(operatorNode: node, parent: element)
//
//        } else {
//            if let first = node.children.first {
//                reconcile(node: first, element: element)
//            }
//        }
//    }
//    
//    func reconcile(htmlNode: ElementNode, element: JSNode) {
//        // update the HTML element shallowly
//        element.updateShallow(with: htmlNode)
//        
////        documentNode.printNode()
//        
//        if !reconcileIndexStack.isEmpty {
//            reconcileIndexStack[reconcileIndexStack.count - 1] += 1
//        }
//        
//        // create a sub-stack
//        reconcileIndexStack.append(0)
//        
//        // get the
//        if let first = htmlNode.children.first as? OperatorNode {
//            guard htmlNode.children.count == 1 else {
//                fatalError("HTMLElement contains more than one child")
//            }
//            reconcile(operatorNode: first, parent: element)
//        }
//        
//        // pop from stack
//        guard let endIndex = reconcileIndexStack.popLast() else { return }
////        print(endIndex, "vs.", element.children.count)
//        
////        htmlNode.printNode()
//        
//        // if HTML body had more elements than new dom remove the old
//        for i in (endIndex..<element.children.count).reversed() {
//            let child = element.children[i]
//            child.removeFromDOM()
//        }
//
//    }
//
//    // TODO: check id here? managing routing?
//    // KEEP TRACK OF INDEX IN PARENT AS YOU RECONCILE
//    func reconcile(operatorNode: OperatorNode, parent: JSNode) {
//        // operator node counter, and jsnode/element counter
//        var index: Int = 0
//        var indexParent: Int { reconcileIndexStack.last! }
//        
//        let (newSize, oldSize) = (operatorNode.children.count, Int(parent.children.count))
//        
//        // TODO: CHECK IF ELEMENT HAS A TEXT OR ELEMENTS ie: nodetype 1, or 3
//        while index < newSize && indexParent < oldSize {
//            let child = parent.children[indexParent]
//            let childPageNode = operatorNode.children[index]
//            
//            if childPageNode is OperatorNode {
//                reconcile(node: childPageNode, element: parent)
////                reconcile(operatorNode: childPageNode, parent: parent)
//            } else {
//                reconcile(node: childPageNode, element: child)
//            }
//
//            index += 1
//            
//        }
//                
//        // if js dom had less elements than new dom, build,
//        // Adding extra children
//        for i in index..<newSize {
//            // TODO: Test this
////            reconcile(node: operatorNode.children[i], parent: parent)
//
//            if let operatorChild = operatorNode.children[i] as? ElementNode {
//                
//                let newElement = JSNode(named: (operatorChild.page as! any Element).name)
////                let newElement = JSNode()
//                parent.addChild(newElement)
//                reconcile(htmlNode: operatorChild, element: newElement)
////                parent.addChild(newElement)
//
//
//            } else if operatorNode.children[i] is CustomNode {
//                // TODO: refactor to remove this shouldnt need to make a dummy node
//                let newElement = JSNode(named: "DIV")
//                parent.addChild(newElement)
//                reconcile(node: operatorNode.children[i], element: newElement)
////                parent.addChild(newElement)
//
//            } else {
////                let newElement = JSNode()
////                parent.addChild(newElement)
//                reconcile(node: operatorNode.children[i], element: parent)
//
//            }
//            
//        }
//    
//    }
    
}
