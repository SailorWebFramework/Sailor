


import Foundation
import Sailor

struct HomePage: Page {
    @State var myName: Int = 0

    var body: some Page {
        Div {
            
            if myName % 2 == 0 {
                Hey1Page()
            }
            
            Div() {
                Div("HELLO: \(myName)")
                    .style(.backgroundColor(.rgb(200, 0, 0)))
                
                Div("yuh: \(myName + 1)")
                Div("skee: \(myName + 2)")
                Div("SOR: \(myName)")

            }

            Div("SOL: \(myName + 242)")
            .onClick {
                myName += 1
            }
            
        }
    }
}

//@Route("\about")
struct Hey1Page: Page {
    @State var hello: Int = 1

    var body: some Page {
        Div {
            Div("brrr: \(hello)")
                .onClick {
                    hello += 1
                }
        }
    }
}

