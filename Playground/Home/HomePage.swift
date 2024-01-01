
import Foundation
import Sailor

//@StaticPage
struct HomePage: Page {
    @State var myNum: Int = 0

    var body: some Page {
//        @Route("\about")
        Div {
            
//            if myName % 2 == 0 {
//                Hey1Page()
//            }
            Div("HELLO WORLD")
            Button("Press me: \(myNum)")
//            .onClick {
//                myNum += 1
//            }
            
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

