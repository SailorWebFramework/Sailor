
import Sailor


struct SubPage: Page {
    
    @Binding var mynum: Int
    
    @State var num: Int = 0

    
    var body: some Page {
        Div {
            Div("UPPER WORD! \(mynum)")
                .onClick {
                    mynum += 1
                }
            Div("MY WORD! \(num)")
                .onClick {
                    num += 1
                }
        }
    }
}


//@StaticPage
struct HomePage: Page {
    @State var myNum: Int = 0

    var body: some Page {
//        @Route("\about")
        Div {
            if myNum % 2 == 0 {
                
//                Route("#about",
//                    Div(
//                        .className("my-class-name")
//                        .src($myUrl),
//                    )
//                )

                Div("HELLO WORLD!")
                if myNum % 2 == 0 {
                    Div("Second Lower!")
                }
                
//                SubPage(mynum: $myNum)

            } else {
                Div("Goodbye World!")
                
//                if myNum % 3 == 0 {
//                    Div("THird Lower!")
//                        .style(
//                            .backgroundColor(.rgb(200, 0, 0))
//                        )
//                }
            }
            
            SubPage(mynum: $myNum)

            Button("Press me: \(myNum)")
                .style(
                    .backgroundColor(myNum % 4 == 0 ? .rgb(0, 0, 200) : .rgb(0, 200, 0)),
                    .width(.px(200))
                )
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

