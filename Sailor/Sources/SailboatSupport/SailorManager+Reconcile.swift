//
//  File.swift
//  
//
//  Created by Joshua Davis on 1/1/24.
//

import Foundation
import JavaScriptKit
import Sailboat


extension SailorManager {
    
    // TODO: problem need parent thing and an element reconcile
    // TODO: make helpers for JSKit stuff and manage all force casting errors
    internal func reconcile(node: any PageNode, element: JSObject) {
        // TODO: logic to reconcile the DOMTree with the Virtual DOM
        print(node, element.description)
        
        if let node = node as? HTMLNode,
           let page = node.page as? any HTMLElement
        {
            guard let tagName = element.tagName.string else {
                print("tagName no exists")
                return
            }
            // check tag if its the same
            if tagName == page.name {
                // if the same modify attributes and events
                buildHTMLNode(node: node, element: element)

            } else {
                // if different replace element
                var newElement = Self.document.createElement?(page.name)
                // TODO: add attributes, content, events
                _ = element.parentNode.replaceChild(newElement, element)
            }
            
            if let first = node.children.first {
                reconcile(node: first, element: element)
            }

        }
        else if let node = node as? OperatorNode,
           let page = node.page as? any Operator
        {
            
            // TODO: check id here? managing routing?
            
            let (newSize, oldSize) = (node.children.count, Int(element.children.length.number!))
            let endRange = min(oldSize, newSize)
            
            var (iNode, iElement) = (0, 0)
            // TODO: element.children has some other random garbage that i must check for and modify loop range , probably need a while llooop
            while iNode < newSize && iElement < oldSize {
                let child = element.children[iElement]
                if child.nodeType.number == 1 {
                    reconcile(node: node.children[iNode], element: child.object!)
                    
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
                for i in endRange..<oldSize {
                    let child = element.children[i]
                    
                    _ = element.removeChild?(child)
                    
                    // TODO: maybe remove attributes and events?
                }

            }

            // if js dom had less elements than new dom, build
            if iElement >= oldSize {
                print("ADDING EXTRA CHILDREN")
                for i in endRange..<newSize {
                    // TODO: somehow make a dummy node for it or somthing?
                    var newElement: JSValue
                    
                    if let page = node.children[i].page as? any HTMLElement {
                        newElement = Self.document.createElement!(page.name)
                    } else {
                        newElement = Self.document.createElement!("div")
                    }
                    
                    _ = element.addChild?(newElement)
                    
                    reconcile(node: node.children[i], element: newElement.object!)
                }

            }
        }
        else {
            if let first = node.children.first {
                reconcile(node: first, element: element)
            }
        }
        
    }
    
    private func buildHTMLNode(node: HTMLNode, element: JSObject) {
        guard let page = node.page as? any HTMLElement else { return }

        // TODO: need to store events somewhere?
//        build(events: page.events)

        if case let .text(value) = page.content {
            element.textContent = JSValue.string(value)
        }

//        build(attributes: page.attributes)
        
        
//        for (key, value) in element.attributes {
//            _ = element.removeAttribute?(key, value)
//        }
        
        
        // TODO: DIFF ATTRIBUTES AND UPDATE
//        let attributes = element.attributes!

        // Since removing attributes will modify the collection, it's safer to first
        // collect all attribute names and then remove them
//        var attributeNames: [String] = []
//        for index in 0..<attributes.length!.number! {
//            let attribute = attributes.item!(index)
//            if let attributeName = attribute.nodeName.string {
//                attributeNames.append(attributeName)
//            }
//        }
//
//        // Remove each attribute
//        for attributeName in attributeNames {
//            element.removeAttribute?(attributeName)
//        }
        
        for (key, value) in node.attributes {
            _ = element.setAttribute?(key.description, value.description)
        }

    }
    
    private func reconcileNewElement(node: any PageNode, parent: JSObject) {
        
    }
    
}
