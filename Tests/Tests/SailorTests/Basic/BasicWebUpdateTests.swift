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
final class BasicWebUpdateTests: XCTestCase, SailorTestCase {

    override func setUp() {
        super.setUp()
        SailorGlobal.initialize(SailorManager())
    }

    override func tearDown() {
        sailorManager.documentNode.reset()
        SailorGlobal.manager = nil
    }

    func testBasicStateRender() throws {
        simulateTest(with: BasicStatefulPage0()) { i in
            simulateClick(
                getElement(
                    getBody(
                        getBody(sailboatManager.body!)
                    )
                , at: 0)
            )
            
            verifyDOM()
        }
    }

    func testBasicSingleIFStateRender() throws {
        print("SAILOR TEST")
        sailorManager.build(page: BasicStatefulPage1())

        sailboatManager.body!.printNode()
        printBody()

        verifyDOM()

        print("END SAILOR")

    }

    func testBasicSingleIFElseStateRender() throws {
        print("SAILOR TEST")
        sailorManager.build(page: BasicStatefulPage2())

        sailboatManager.body!.printNode()
        printBody()

        verifyDOM()

        print("END SAILOR")

    }

    func testBasicSingleIFDuoStateRender() throws {
        print("SAILOR TEST")
        sailorManager.build(page: BasicStatefulPage4())

        sailboatManager.body!.printNode()
        printBody()

        verifyDOM()

        print("END SAILOR")

    }

    func testBasicLargeIfStateRender() throws {
        print("SAILOR TEST")
        sailorManager.build(page: BasicStatefulPage6())

        sailboatManager.body!.printNode()
        printBody()

        verifyDOM()

        print("END SAILOR")

    }

    func testBasicLargeIfChainStateRender() throws {
        print("SAILOR TEST")
        sailorManager.build(page: BasicStatefulPage5())

        sailboatManager.body!.printNode()
        printBody()

        verifyDOM()

        print("END SAILOR")

    }
}
//#endif
