//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/30/23.
//

import Sailboat

struct BasicUpdatePage: Page {
    @State var myNum: Int = 0
    var body: some Page {
        Button("myNum: \(myNum)")
            .onClick {
                myNum += 1
            }
//        Div {
//            Div {
//                BasicStatefulPage1()
//            }
//
//            
//        }
    }
}
