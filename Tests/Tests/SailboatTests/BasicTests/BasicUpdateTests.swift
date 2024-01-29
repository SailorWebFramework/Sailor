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
    
    override func tearDown() {
        SailboatGlobal.shared = nil
    }
    
    func testTextUpdate() {
        simulateTest(
            with: SailboatBasic0UpdatePage(),
            foreach: { i in
                testPage(
                    page:
                        TDiv {
                            TButton("myNum: \(i)").onClick { }
                        }
                )

                simulateClick(
                    getElement(
                        getBody(
                            getBody(sailboatManager.body!)
                        )
                    , at: 0)
                )

            }
        )
    }
    
    func testNilConditionalSingleUpdateText() {
        simulateTest(
            with: SailboatBasic1UpdatePage(),
            foreach: { i in
                
                printBody()

                testPage(
                    page:
                        TDiv {
                            Conditional(
                                i % 4 == 0 ? [TDiv("Im Here")] : []
                            )
                            TButton("myNum: \(i)").onClick { }
                        }
                )

                simulateClick(
                    getElement(
                        getBody(
                            getBody(sailboatManager.body!)
                        )
                    , at: 1)
                )

            }
        )
    }
    
    func testNilConditionalMultiple() {
        simulateTest(
            with: SailboatBasic2UpdatePage(),
            foreach: { i in
                
                printBody()

                testPage(
                    page:
                        TDiv {
                            Conditional(
                                i % 4 == 0 ? [
                                    TDiv("Im Here"),
                                    TDiv("its: \(i)")
                                ] : []
                            )
                            TButton("myNum: \(i)").onClick { }
                        }
                )

                simulateClick(
                    getElement(
                        getBody(
                            getBody(sailboatManager.body!)
                        )
                    , at: 1)
                )

            }
        )
    }
    
    func testConditionalOne() {
        simulateTest(
            with: SailboatBasic3UpdatePage(),
            foreach: { i in
                
                printBody()

                testPage(
                    page:
                        TDiv {
                            Conditional(
                                i % 4 == 0 ? [
                                    TDiv("Im Here"),
                                    TDiv("its: \(i)")
                                ] : [TDiv("Not Here")]
                            )
                            TButton("myNum: \(i)").onClick { }
                        }
                )

                simulateClick(
                    getElement(
                        getBody(
                            getBody(sailboatManager.body!)
                        )
                    , at: 1)
                )

            }
        )
    }
    
    func testNestedNilConditional() {
        simulateTest(
            with: SailboatBasic4UpdatePage(),
            foreach: { i in
                
                printBody()

                testPage(
                    page:
                        TDiv {
                            Conditional(
                                i % 4 == 0 ? [
                                    TDiv("One"),
                                    Conditional([
                                        TDiv("Two"),
                                        Conditional([
                                            TDiv("Three")
                                        ])
                                    ])
                                ] : []
                            )
                            TButton("myNum: \(i)").onClick { }
                        }
                )

                simulateClick(
                    getElement(
                        getBody(
                            getBody(sailboatManager.body!)
                        )
                    , at: 1)
                )

            }
        )
    }
    
    func testSingleSubComponent() {
        simulateTest(
            with: SailboatBasic5UpdatePage(),
            foreach: { i in
                
                printBody()

                testPage(
                    page:
                        TDiv {
                            Conditional(
                                i % 4 == 0 ? [
                                    SailboatBasicSubTest(myNum: .constant(i))
//                                    TDiv("#: \(i)")
                                ] : []
                            )
                            TButton("myNum: \(i)").onClick { }
                        }
                )

                simulateClick(
                    getElement(
                        getBody(
                            getBody(sailboatManager.body!)
                        )
                    , at: 1)
                )

            }
        )
    }
    
//    func testStatefulContent() {
////        sailboatManager.build(page: BasicStatefulPage0())
//
//        simulateTest(
//            with: BasicStatefulPage0(),
//            foreach: { i in
//                testPage(
//                    page:
//                        Div {
//                            Button("hello: \(i)").onClick { }
//                        }
//                )
//
//                simulateClick(
//                    getElement(
//                        getBody(
//                            getBody(sailboatManager.body!)
//                        )
//                    , at: 0)
//                )
//
//            }
//        )
//
//    }
//
//    func testStatefulIf() {
//        sailboatManager.build(page: BasicStatefulPage1())
//        printBody()
//
//        for i in 0..<10 {
//
//            if i % 2 == 0 {
//                testPage(
//                    page: Div {
//                            Conditional([
//                                Div("Inner Div")
//                            ])
//                            Button("hello: \(i)")
//                            .onClick { }
//                        },
//                    node: sailboatManager.body!.children.first!
//                )
//            } else {
//                testPage(
//                    page: Div {
//                            Conditional([
//                                Div("")
//                            ])
//                            Button("hello: \(i)")
//                            .onClick { }
//                        },
//                    node: sailboatManager.body!.children.first!
//                )
//            }
//
//            simulateClick(
//                getElement(
//                    getBody(
//                        getBody(sailboatManager.body!)
//                    )
//                , at: 1)
//            )
//            printBody()
//
//        }
//
//        printBody()
//
//    }
//
//    func testStatefulAlternatingIf() {
//        sailboatManager.build(page: BasicStatefulPage3())
//
//        print("START")
//        for i in 0..<10 {
//            if i % 2 == 0 {
//                testPage(
//                    page: Div {
//                            Conditional([
//                                Div("Inner Div")
//                            ])
//                            Button("hello: \(i)")
//                            .onClick { }
//                        },
//                    node: sailboatManager.body!.children.first!
//                )
//
//            } else {
//                testPage(
//                    page: Div {
//                            Conditional([
//                                Div("Other Inner Div")
//                            ])
//                            Button("hello: \(i)")
//                            .onClick { }
//                        },
//                    node: sailboatManager.body!.children.first!
//                )
//            }
//
//            simulateClick(
//                getElement(
//                    getBody(
//                        getBody(sailboatManager.body!)
//                    )
//                , at: 1)
//            )
//            printBody()
//
//        }
//
//
//    }
//
//    func testStatefulAlternatingIfElse() {
//        sailboatManager.build(page: BasicStatefulPage2())
//
//        for i in 0..<10 {
//            if i % 3 == 0 {
//                testPage(
//                    page: Div {
//                            Conditional([
//                                Div("Inner Div")
//                            ])
//                            Button("hello: \(i)")
//                            .onClick { }
//                        },
//                    node: sailboatManager.body!.children.first!
//                )
//
//            } else if i % 3 == 1 {
//                testPage(
//                    page: Div {
//                            Conditional([
//                                Div("Other Inner Div")
//                            ])
//                            Button("hello: \(i)")
//                            .onClick { }
//                        },
//                    node: sailboatManager.body!.children.first!
//                )
//
//            } else {
//                testPage(
//                    page: Div {
//                            Conditional([
//                                Div("Other Third Div")
//                            ])
//                            Button("hello: \(i)")
//                            .onClick { }
//                        },
//                    node: sailboatManager.body!.children.first!
//                )
//            }
//
//            simulateClick(
//                getElement(
//                    getBody(
//                        getBody(sailboatManager.body!)
//                    )
//                , at: 1)
//            )
//            printBody()
//
//        }
//
//        printBody()
//
//    }
//
//    func testStatefulManyIfs() {
////        sailboatManager.build(page: BasicStatefulPage6())
////
////        for i in 0..<10 {
//////            if i % 3 == 0 && i % 2 == 0 && i % 4 == 0 {
//////                testPage(
//////                    page: Div {
//////                        Div("First Inner Div")
//////                        Div("Second Inner Div")
//////                        Div("THird Inner Div")
//////                        Div("Fourth Inner Div")
//////                        Button("hello: \(i)").onClick { }
//////                    },
//////                    node: sailboatManager.body!.children.first!
//////                )
//////
//////            } else if {
//////                testPage(
//////                    page: Div {
//////                            Conditional([
//////                                Div("Other Third Div")
//////                            ])
//////                            Button("hello: \(i)")
//////                            .onClick { }
//////                        },
//////                    node: sailboatManager.body!.children.first!
//////                )
//////            }
//////
//////            simulateClick(
//////                getElement(
//////                    getBody(
//////                        getBody(sailboatManager.body!)
//////                    )
//////                , at: 1)
//////            )
//////            printBody()
////
////        }
////
////        printBody()
//
//    }

}
