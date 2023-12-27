
import Foundation
import Sailor

//@StaticPage
struct HomePage: Page {
    @State var myName: Int = 0

    var body: some Page {
//        @Route("\about")
        Div {
            
            if myName % 2 == 0 {
                Hey1Page()
            }

            Button("Press me: \(myName)")
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
            Button("brrr: \(hello)")
                .onClick {
                    hello += 1
                }
        }
    }
}

