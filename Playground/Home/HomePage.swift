import Sailor

struct SubSubPage: Page {
    
    var body: some Page {
        Div {
            Div("Sub Sub")
            Button("Here")
        }
    }
}
struct SubPage: Page {
    
    @Binding var mynum: Int
    @State var num: Int = 0
        
    var body: some Page {
        Div {
            Div("UPPER WORD! \(mynum) {")
            if num % 2 == 0 {
                SubSubPage()
            }
            Div("} MY WORD! \(num)")
//                .title("hello")
                .attribute(.title("hello"))
                .onClick {
                    num += 1
                }
        }
    }
}

//@StaticPage
struct HomePage: Page {
    @State var myNum: Int = 0
    @State var toggle: Bool = true

    var body: some Page {
        Div {
            
            if myNum % 4 == 0 {
                Div {
                    Div("Second Lower!")
                    Div("Another Lower!")
                    
                    if toggle {
                        Div("HEY IM HERE")
                        SubPage(mynum: $myNum)
                    }
                    
                    Button("Press ME: \(toggle)")
                        .onClick {
                            toggle.toggle()
                        }
                }
            } else if myNum % 4 == 1 {
                SubPage(mynum: $myNum)

            } else {
                Div("THIRD Lower!")
                    .attribute(.className("hello"))
                    .attribute(.data("text", "I am stored here"))
                    .style(
                        .backgroundColor(
                            .rgb(Percent(20), Percent(20), Percent(20)),
                            .rgb%(20, 20, 20)
                        ),
                        .width(.px(100))
                    )
            }
            
            Button("Press this button: \(myNum)")
                .onClick {
                    myNum += 1
                }
        }
    }
    
}

//struct MyView: View {
//
//    var body: some Page {
//        VStack {
//            Text("")
//        }
//    }
//}
