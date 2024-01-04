//
//  File.swift
//  
//
//  Created by Joshua Davis on 1/3/24.
//

import XCTest
@testable import Sailor


protocol SailorTestCase: SailboatTestCase {
    var sailorManager: SailorManager { get }
}

extension SailorTestCase {
    
    var sailorManager: SailorManager {
        SailorGlobal.shared as! SailorManager
    }
    
    var jsnode: JSNode {
        sailorManager.documentNode
    }
    
    internal func printBody() {
        sailorManager.documentNode.printNode()
    }
    
    func getJSChild(_ node: JSNode, at index: Int = 0) -> JSNode {
        if index < node.children.count {
            return node.children[index]
        }
        XCTAssertTrue(false, "JSNode does not have child at index \(index)")
        fatalError()
    }
    
    internal func compare(htmlNode: HTMLNode, jsnode: JSNode) -> Bool {
        guard let page = htmlNode.page as? any HTMLElement else { return false }
        
        // CHECK TAG
        if page.name.uppercased() != jsnode.tagName?.uppercased() {
            return false
        }
        
        // CHECK Content
        
        
        if case let .text(value) = htmlNode.content {
            if jsnode.content != value {
                return false
            }
        } else {
            if jsnode.content == nil || jsnode.content == "" {
                return false
            }
        }
                
        // CHECK ATTRIBUTES
        if !htmlNode.attributes.eqauls(jsnode.attributes) {
            return false
        }
        
        // CHECK EVENTS
        if htmlNode.events.keys != htmlNode.events.keys {
            print("DIED EVENTS")
            return false
        }
        
        print("DIDNT DIED")

        return true
    }
    
    internal func verifyDOM() {
        let body = sailorManager.body!
        let node = getJSChild(jsnode)

        func traverse(pageNode: any PageNode, jsnode: JSNode, wasHTML: Bool) {
            print("comparing \(pageNode) to \(jsnode), wasHTML? \(wasHTML)")
            if let pageNode = pageNode as? HTMLNode {
                
                XCTAssertTrue(
                    compare(htmlNode: pageNode, jsnode: jsnode),
                    "HTML node \"\(pageNode)\" not equal to jsNode \"\(jsnode)\""
                )
                
                if !pageNode.children.isEmpty {
                    traverse(
                        pageNode: pageNode.children.first!,
                        jsnode: jsnode,
                        wasHTML: true
                    )
                }

            } else if let pageNode = pageNode as? OperatorNode {
                if wasHTML && jsnode.children.count != pageNode.children.count {
                    XCTAssertTrue(false, "JSNode does not have same amount of children as it does in DOM")
                }
                
                for i in 0..<jsnode.children.count {
                    traverse(
                        pageNode: pageNode.children[i],
                        jsnode: jsnode.children[i],
                        wasHTML: false
                    )
                }
            } else {
                traverse(
                    pageNode: pageNode.children.first!,
                    jsnode: jsnode,
                    wasHTML: false
                )
            }
        }
        
        traverse(pageNode: body, jsnode: node, wasHTML: false)
    }
}
