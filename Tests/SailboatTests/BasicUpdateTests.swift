//
//  File.swift
//
//
//  Created by Joshua Davis on 12/28/23.
//

import XCTest
@testable import Sailboat

final class BasicUpdateTests: XCTestCase {
    
    var sailboatManager: (any AppManager)! {
        SailboatGlobal.shared
    }
    
    override class func setUp() {
        SailboatGlobal.initialize(DefaultManager())
    }
    
    func testBasicUpdateOne() throws {
        sailboatManager.build(page: BasicUpdatePage())
        sailboatManager.body!.printNode()
        
//        XCTAssertEqual(sailboatManager.states.count, 1, "State not initialized correctly")
        XCTAssertEqual(sailboatManager.body!.children.count, 1, "Custom not initialized correctly")
        
        var wrapperButton: HTMLNode! = sailboatManager.body!.children[0] as! HTMLNode
        
        XCTAssertEqual(wrapperButton.events.count, 1, "Button events not initialized correctly")
        
        var content: String?
        
        if case let .text(buttonContent) = wrapperButton.content {
            content = buttonContent
        } else {
            content = nil
        }
        
        XCTAssertEqual(content, "myNum: 0", "Button state not updating correctly")

        wrapperButton.events["click"]!.action(.none)
        
        if case let .text(buttonContent) = wrapperButton.content {
            content = buttonContent
        } else {
            content = nil
        }
        
        XCTAssertEqual(content, "myNum: 1", "Button state not updating correctly")

        wrapperButton.events["click"]!.action(.none)
        
        if case let .text(buttonContent) = wrapperButton.content {
            content = buttonContent
        } else {
            content = nil
        }
        
        XCTAssertEqual(content, "myNum: 2", "Button state not updating correctly")

        sailboatManager.body!.printNode()

        return
    }
    
    // TODO: more complex tests and make helper classes / tests
    
}
