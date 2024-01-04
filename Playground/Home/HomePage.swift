
import Sailor

//@StaticPage
struct HomePage: Page {
    @State var myNum: Int = 0
    @State var mystring: String = ""

    var body: some Page {
//        @Route("\about")
        Div {
            if myNum % 2 == 0 {
                Div("HELLO WORLD!")
            } else {
                Div("YO ITS ME!")
            }
            
            if myNum % 2 == 0 {
                Div("YO WORLD! \(mystring)")
                    .onClick {
                        mystring += "4"
                    }
            }

            Button("Press me: \(myNum)")
            .onClick {
                myNum += 1
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

