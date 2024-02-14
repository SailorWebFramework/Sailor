//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/28/23.
//

import XCTest
@testable import Sailboat

// TODO: tests that test the build mechanics of Sailboat
final class BasicBuildTests: XCTestCase {
    
    var sailboatManager: (any TargetManager)! {
        SailboatGlobal.manager
    }
    
    override func setUp() {
        // TODO:
//        SailboatGlobal.initialize(DefaultManager())
    }
    
    override func tearDown() {
        SailboatGlobal.manager = nil
    }
    
    // TODO: add build tests
//
//    func testInitialBasicStateMemoryLeak() throws {
//        sailboatManager.build(page: BasicStatelessPage())
//
////        XCTAssertEqual(State.count, 0, "State not initialized correctly")
////
////        sailboatManager.build(page: BasicStatefulPage0())
////
////        XCTAssertEqual(State.count, 1, "State not initialized correctly")
////
////        sailboatManager.build(page: BasicStatelessPage())
////
////        XCTAssertEqual(State.count, 0, "State not removed correctly")
////
////        sailboatManager.build(page: BasicStatefulPage1())
////
////        XCTAssertEqual(State.count, 2, "State not initialized correctly")
////
////        sailboatManager.build(page: BasicStatefulPage1())
////
////        XCTAssertEqual(State.count, 2, "State not initialized correctly")
////
////        sailboatManager.build(page: BasicStatefulPage0())
////
////        XCTAssertEqual(State.count, 1, "State not initialized correctly")
//
//        return
//    }
    
//    func testStatefulPageBuild() throws {
//
//        sailboatManager.build(page: BasicStatefulPage2())
//
////        XCTAssertEqual(State.count, 3, "State not initialized correctly")
//
////        XCTAssertEqual(sailboatManager.states[0] as! Int, 2, "State not initialized correctly")
////        XCTAssertEqual(sailboatManager.states[1] as! Int, 1, "State not initialized correctly")
////        XCTAssertEqual(sailboatManager.states[2] as! Int, 0, "State not initialized correctly")
//
//        // verify build tree
//        sailboatManager.body?.printNode()
//    }
//

}
