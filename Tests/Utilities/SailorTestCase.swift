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
    
    var testIterations: Int { 20 }
    
    var sailorManager: SailorManager {
        SailorGlobal.manager as! SailorManager
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
        guard let page = htmlNode.page as? any HTMLElement else {
            print("FAILED")
            return false
            
        }
        
        // CHECK TAG
        if page.name.uppercased() != jsnode.tagName?.uppercased() {
            print("FAILED")
            return false
        }
        
        // CHECK Content
        
        
        if case let .text(value) = htmlNode.content {
            if jsnode.content != value {
                print("FAILED")
                return false
            }
        } else {
            if jsnode.content == nil || jsnode.content == "" {
                print("FAILED")
                return false
            }
        }
        
        // TODO: check attributes in SailorTestCase
//        for (key, value) in htmlNode.attributes {
//            if let curValue = jsnode.attributes[key] { return false }
//            if value != curValue {
//                return false
//            }
//        }
        
        // CHECK ATTRIBUTES
//        if !htmlNode.attributes == jsnode.attributes {
//            print("FAILED")
//            return false
//        }
//
        // CHECK EVENTS
        if htmlNode.events.keys != htmlNode.events.keys {
            print("FAILED")
            return false
        }
        
        return true
    }
    
    internal func verifyDOM() {
        let body = sailorManager.body!

        // TODO: THis test is broken asf
        func compareHTML(pageNode: HTMLNode, jsnode: JSNode) {
            print("comparingHTML: \(pageNode) , to: \(jsnode)")

            XCTAssertTrue(
                compare(htmlNode: pageNode, jsnode: jsnode),
                "HTML node \"\(pageNode)\" not equal to jsNode \"\(jsnode)\""
            )
            
            print("HTMLNODE", pageNode.children.isEmpty)

            if !pageNode.children.isEmpty {
                var stack: [JSNode]? = nil
                traverse(
                    pageNode: pageNode.children.first!,
                    parent: jsnode,
                    stack: &stack
                )
            }
        }
        // TODO: might be some issues if stack is too large ie too many jsnodes, but they are correct idk tho
        func traverse(pageNode: any PageNode, parent: JSNode, stack: inout [JSNode]?) {
            print("comparing: \(pageNode) , using parent: \(parent)")
            print("stack: \(stack)")

            if let pageNode = pageNode as? HTMLNode {
                if let firstjs = parent.children.first {
                    
                    compareHTML(pageNode: pageNode, jsnode: firstjs)

                } else {
                    XCTAssertTrue(false, "HTML node has incorrect number of children")
                }
                
            } else if let pageNode = pageNode as? OperatorNode {
                
                if stack == nil {
                    stack = parent.children
                }

                for i in 0..<pageNode.children.count {
                    if !(stack?.isEmpty ?? true) {
                        if let childNode = pageNode.children[i] as? HTMLNode,
                           let jschild = stack?.removeFirst()
                        {
                            compareHTML(
                                pageNode: childNode,
                                jsnode: jschild
                            )
                        } else {
                            traverse(
                                pageNode: pageNode.children[i],
                                parent: parent,
                                stack: &stack
                            )
                        }

                    } else {
                        // ERROR
                        XCTAssertTrue(false, "node has less more pages then jsnodes, no \(pageNode.children[i])")
                    }
                }
            } else {
                if !pageNode.children.isEmpty {
                    traverse(
                        pageNode: pageNode.children.first!,
                        parent: parent,
                        stack: &stack
                    )
                } else {
                    XCTAssertTrue(false, "Custom Page has no body")
                }
            }
        }
        
        var stack: [JSNode]? = nil
        traverse(pageNode: body, parent: jsnode, stack: &stack)
    }
}
