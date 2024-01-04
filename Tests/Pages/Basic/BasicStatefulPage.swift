//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/28/23.
//

import Sailboat

struct BasicStatefulPage0: Page {
    @State var hello: Int = 0
    var body: some Page {
        Div {
            Button("hello: \(hello)")
                .onClick {
                    hello += 1
                }
        }
    }
}

struct BasicStatefulPage1: Page {
    @State var hello: Int = 0
    var body: some Page {
        Div {
            if hello % 2 == 0 {
                Div("Inner Div")
            }
            
            Button("hello: \(hello)")
                .onClick {
                    hello += 1
                }
        }
    }
}

struct BasicStatefulPage2: Page {
    @State var hello: Int = 0
    var body: some Page {
        Div {
            if hello % 3 == 0 {
                Div("Inner Div")
            } else if hello % 3 == 1 {
                Div("Other Inner Div")
            } else {
                Div("Other Third Div")
            }
            
            Button("hello: \(hello)")
                .onClick {
                    hello += 1
                }
        }
    }
}

struct BasicStatefulPage3: Page {
    @State var hello: Int = 0
    var body: some Page {
        Div {
            if hello % 2 == 0 {
                Div("Inner Div")
            } else {
                Div("Other Inner Div")
            }
            
            Button("hello: \(hello)")
                .onClick {
                    hello += 1
                }
        }
    }
}
