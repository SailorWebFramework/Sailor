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
final class BasicUpdateRenderTests: XCTestCase, SailorTestCase {
    
    override func setUp() {
        SailorGlobal.initialize(SailorManager())
    }
    
    func testBasicStateRender() throws {
        print("SAILOR TEST")
        sailorManager.build(page: BasicStatefulPage0())
        
        sailboatManager.body!.printNode()
        printBody()
        
        verifyDOM()
        
        print("END SAILOR")

    }
    
    func testBasicSingleIFStateRender() throws {
        print("SAILOR TEST")
        sailorManager.build(page: BasicStatefulPage1())
        
        sailboatManager.body!.printNode()
        printBody()
        
        verifyDOM()
        
        print("END SAILOR")

    }
}
//#endif
