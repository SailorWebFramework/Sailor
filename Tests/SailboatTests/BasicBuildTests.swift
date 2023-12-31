//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/28/23.
//

import XCTest
@testable import Sailboat

final class BasicBuildTests: XCTestCase {
    
    var sailboatManager: (any GlobalDOMManager)! {
        SailboatGlobal.shared
    }
    
    override class func setUp() {
        SailboatGlobal.initialize(DefaultManager())
    }
    
    func testInitialBasicStateMemoryLeak() throws {
        sailboatManager.build(page: BasicStatelessPage())

        XCTAssertEqual(sailboatManager.states.count, 0, "State not initialized correctly")

        sailboatManager.build(page: BasicStatefulPage0())
        
        XCTAssertEqual(sailboatManager.states.count, 1, "State not initialized correctly")
        
        sailboatManager.build(page: BasicStatelessPage())

        XCTAssertEqual(sailboatManager.states.count, 0, "State not removed correctly")

        sailboatManager.build(page: BasicStatefulPage1())
        
        XCTAssertEqual(sailboatManager.states.count, 2, "State not initialized correctly")

        sailboatManager.build(page: BasicStatefulPage1())
        
        XCTAssertEqual(sailboatManager.states.count, 2, "State not initialized correctly")

        sailboatManager.build(page: BasicStatefulPage0())
        
        XCTAssertEqual(sailboatManager.states.count, 1, "State not initialized correctly")

        return
    }
    
    func testStatefulPageBuild() throws {
        
        sailboatManager.build(page: BasicStatefulPage2())

        XCTAssertEqual(sailboatManager.states.count, 3, "State not initialized correctly")

        XCTAssertEqual(sailboatManager.states[0] as! Int, 2, "State not initialized correctly")
        XCTAssertEqual(sailboatManager.states[1] as! Int, 1, "State not initialized correctly")
        XCTAssertEqual(sailboatManager.states[2] as! Int, 0, "State not initialized correctly")
        
        // verify build tree
        sailboatManager.body?.printNode()
    }
    
    func testLoginFailure() {
        
    }
}
