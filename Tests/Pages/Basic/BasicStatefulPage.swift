//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/28/23.
//

import Foundation
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
    @State var hello1: Int = 1
    var body: some Page {
        Div {
            Div {
                BasicStatefulPage0()
            }

            Button("hello1: \(hello1)")
                .onClick {
                    hello1 += 1
                }
        }
    }
}

struct BasicStatefulPage2: Page {
    @State var hello2: Int = 2
    var body: some Page {
        Div {
            Div {
                BasicStatefulPage1()
            }

            Button("hello2: \(hello2)")
                .onClick {
                    hello2 += 1
                }
        }
    }
}


