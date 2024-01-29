//
//  File.swift
//
//
//  Created by Joshua Davis on 1/3/24.
//

import XCTest
@testable import Sailor

//#if !os(macOS)
/// tests , requires wasm
final class JSNodeTests: XCTestCase, SailorTestCase {

    override func setUp() {
        super.setUp()
        SailorGlobal.initialize(SailorManager())
    }

    override func tearDown() {
        sailorManager.documentNode.reset()
        SailorGlobal.shared = nil
    }

    func testBasicStateRender() throws {
        print("SAILOR TEST")
        sailorManager.build(page: BasicStatefulPage0())
        
        sailboatManager.body!.printNode()
        printBody()

        verifyDOM()

        print("END SAILOR")

    }

}
//#endif
