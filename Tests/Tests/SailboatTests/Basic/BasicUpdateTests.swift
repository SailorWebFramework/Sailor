//
//  File.swift
//
//
//  Created by Joshua Davis on 12/28/23.
//

import XCTest
@testable import Sailboat

/// tests the overall updating structure of virtual sailboat upon state changes
final class BasicUpdateTests: XCTestCase, SailboatTestCase  {
    
    override func setUp() {
        SailboatGlobal.initialize(DefaultManager())
    }
    
    func testStatefulContent() {
        sailboatManager.build(page: BasicStatefulPage0())
        
        for i in 0..<10 {
            testPage(
                page: Div {
                        Button("hello: \(i)")
                        .onClick { }
                    },
                node: sailboatManager.body!.children.first!
            )
            
            simulateClick(
                getElement(
                    getBody(
                        getBody(sailboatManager.body!)
                    )
                , at: 0)
            )
        }
        
        printBody()
        
    }
    
    func testStatefulIf() {
        sailboatManager.build(page: BasicStatefulPage1())
        printBody()

        for i in 0..<10 {
            
            if i % 2 == 0 {
                testPage(
                    page: Div {
                            Conditional([
                                Div("Inner Div")
                            ])
                            Button("hello: \(i)")
                            .onClick { }
                        },
                    node: sailboatManager.body!.children.first!
                )
            } else {
                testPage(
                    page: Div {
                            Conditional([
                                Div("")
                            ])
                            Button("hello: \(i)")
                            .onClick { }
                        },
                    node: sailboatManager.body!.children.first!
                )
            }

            simulateClick(
                getElement(
                    getBody(
                        getBody(sailboatManager.body!)
                    )
                , at: 1)
            )
            printBody()

        }
        
        printBody()
        
    }
    
    func testStatefulAlternatingIf() {
        sailboatManager.build(page: BasicStatefulPage3())

        print("START")
        for i in 0..<10 {
            if i % 2 == 0 {
                testPage(
                    page: Div {
                            Conditional([
                                Div("Inner Div")
                            ])
                            Button("hello: \(i)")
                            .onClick { }
                        },
                    node: sailboatManager.body!.children.first!
                )
                
            } else {
                testPage(
                    page: Div {
                            Conditional([
                                Div("Other Inner Div")
                            ])
                            Button("hello: \(i)")
                            .onClick { }
                        },
                    node: sailboatManager.body!.children.first!
                )
            }

            simulateClick(
                getElement(
                    getBody(
                        getBody(sailboatManager.body!)
                    )
                , at: 1)
            )
            printBody()

        }
        
        
    }
    
    func testStatefulAlternatingIfElse() {
        sailboatManager.build(page: BasicStatefulPage2())

        for i in 0..<10 {
            if i % 3 == 0 {
                testPage(
                    page: Div {
                            Conditional([
                                Div("Inner Div")
                            ])
                            Button("hello: \(i)")
                            .onClick { }
                        },
                    node: sailboatManager.body!.children.first!
                )
                
            } else if i % 3 == 1 {
                testPage(
                    page: Div {
                            Conditional([
                                Div("Other Inner Div")
                            ])
                            Button("hello: \(i)")
                            .onClick { }
                        },
                    node: sailboatManager.body!.children.first!
                )
                
            } else {
                testPage(
                    page: Div {
                            Conditional([
                                Div("Other Third Div")
                            ])
                            Button("hello: \(i)")
                            .onClick { }
                        },
                    node: sailboatManager.body!.children.first!
                )
            }

            simulateClick(
                getElement(
                    getBody(
                        getBody(sailboatManager.body!)
                    )
                , at: 1)
            )
            printBody()

        }
        
        printBody()
        
    }

}
