//
//  File.swift
//  
//
//  Created by Joshua Davis on 1/2/24.
//

import XCTest
@testable import Sailboat

protocol SailboatTestCase {
    var sailboatManager: (any AppManager)! { get }
    var testIterations: Int { get }
    
    func printBody()
}

extension SailboatTestCase {
    
    var sailboatManager: (any AppManager)! {
        SailboatGlobal.shared
    }
    
    internal func printBody() {
        sailboatManager.body!.printNode()
    }
    
    internal func simulateClick(_ node: any PageNode) {
        if let node = node as? HTMLNode {
            node.events["click"]?.action(.none)
        }
    }
    
    internal func getElement(_ node: any PageNode, at index: Int) -> any PageNode {
        return node.children[index]
    }
    
    internal func getBody(_ node: any PageNode) -> any PageNode {
        return node.children.first!
    }
    
    internal func simulateTest(with page: any Page, foreach: (Int) -> Void) {
        sailboatManager.build(page: page)
        
        for i in 0..<testIterations {
            foreach(i)
        }
    }
    
    internal func testPage(page: any Page) {
        testPage(page: page, node: sailboatManager.body!.children.first!)
    }
    
    internal func testPage(page: any Page, node: any PageNode) {
        
        if let page = page as? any Operator {
            if page.children.count != node.children.count &&
                type(of: page) == type(of: node.page){
                XCTAssertTrue(false, "operator node \(page) not equal to \(node)")
                return
            }
        }
        else if !node.compare(to: page) {
            XCTAssertTrue(false, "\(page) not equal to \(node)")
            return
        }
        
        if let page = page as? any Operator {
            if page.children.count != node.children.count {
                XCTAssertTrue(false, "operator doesnt have same children")
                return
            }
                        
            for i in 0..<page.children.count {
                testPage(page: page.children[i], node: node.children[i])
            }
            
        } else if let page = page as? any HTMLElement {
            if case let .list(makeList) = page.content {
                testPage(page: makeList(), node: node.children.first!)
            }
            
        } else {
            testPage(page: page.body, node: node.children.first!)
            
        }

    }
}
