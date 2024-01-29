
import Sailor


// IDEAS
//        @Route("\about")

//    @Signal var myNum: Int = 0

//    var head: some Page {
//        Link(
//            .href("$Resources/Global.css")
//        )
//    }

//                Div(#text("My Number is {}", mynum))
//                Div("My Number is \(mynum)", signals: [mynum])

//                Route("#about",
//                    Div(
//                        .className("my-class-name")
//                        .src($myUrl),
//                    )
//                )

//                Div{ "This text will be" B{"Bolded"} "This text will" I{"italic"} }
//
//                Div{ "This text will be \(I{"italic"})" }
//
//                Div{"HELLO WORLD!"}
//                    .attributes(
//                        .className("my-class-name"),
//                        .href("https://www.google.com")
//                    )
//                    .style(
//                        .backgroundColor(.rgb(200, 0, 200))
//                    )
//                    .onClick { print("hello world") }
//
//


//                Div(
//                    .className("my-class-name"),
//                    .style (
//                        .backgroundColor(.rgb(200, 0, 200))
//                    )
//                ) {
//
//                    Div("Hello World!")
//
//                    Div(
//                        .className("my-class-name"),
//                        .style (
//                            .backgroundColor(.rgb(200, 0, 200))
//                        )
//                    ) {
//
//                        Div("Hello World!")
//                        Div("Hello World!")
//
//                    }
//
//                    Div("Hello World!")
//
//                }
//                .onClick { print("hello world") }

//
//
//                Div(
//                    .className("my-class-name"),
//                    .href("https://www.google.com")
//                ) {"HELLO WORLD!"}
//                .style(
//                    .backgroundColor(.rgb(200, 0, 200))
//                )
//                .onClick { print("hello world") }

//                Div(
//                    .className("my-class-name"),
//                    .href("https://www.google.com")
//                ) {
//                    Div("Hello World!")
//
//                }
//                .style(
//                    .backgroundColor(.rgb(200, 0, 200))
//                )

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
//                .src("hello")
                .attribute(.height(100))
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
                .style(
                    .backgroundColor(myNum % 4 == 0 ? .rgb(0, 0, 200) : .rgb(0, 200, 0))
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
