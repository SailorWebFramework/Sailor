import Sailor

//struct InnerPage: Page {
//    var attributes: Attributes = [:]
//
//    @Binding var hello: Int
//    @State var goodbye: Int = 0
//
//    var body: some Page {
//        Div {
//            Div {
//                Div("Yo Whats UP!! Im \(hello) years old")
//                Div("Press me anywhere, \(goodbye)")
//
//                Div("Press me anywhere")
//                Div {
//                    Div("Yo Whats UP!! Im \(hello) years old")
//                    Div("Press me anywhere")
//
//                    Div("Press me anywhere")
//
//                }.onClick {
//                    goodbye += 1
//                }
//                .style(
//                    .backgroundColor(.rgb(0, 200, 0)),
//                    .display(.inlineBlock)
//                )
//            }
//            .style(
//                .backgroundColor(.rgb(200, 0, 0)),
//                .display(.inlineBlock)
//            )
//        }
//    }
//
//}



//@StaticHTML
//@staticHTML
//@main
//struct Test24Page: Page {
//    @Binding var hello: Int
//
//    var body: some Page {
//        Div {
////            @route(name: "home")
//            InnerPage(hello: self._hello)
//
////            @route(name: "testroute")
//            Div("Yo Whats UP!! Im \(hello) years old")
//
////            @route(name: "thirdRoute")
//            Div("Press me anywhere")
//        }
////        .style(
////            .backgroundColor(.rgb(200, 0, 0)),
////            .display(.inlineBlock)
////        )
//    }
//
//}

//struct TestPage: Page {
//    var attributes: Attributes = [:]
//
//    @State var hello = 0
//    @State var bgc: Unit.Color = .rgb(0,0,200)
//    @State var thing: String = "HEY PLACEHOLDER"
//
//    var body: some Page {
//        Div {
//            Div("HEYO")
//            Div("TEST")
//
//            List([
//                Div("HEYO \(hello)"),
//                Div("HEYO \(hello+1)"),
//                Div("HEYO \(hello+2)"),
//                Div("HEYO \(hello+3)")
//            ])
//
//            if hello > 1 && hello < 10 {
//                Div("Yo")
//                Div("Yo")
//                Div("Yo")
//            } else {
//                Div("hey")
//            }
//
//            Span("Yo Whats UP!! \(hello)")
//                // TODO: make this better somehow?
//                // .attribute(.tabindex(.int(0))) // probably this
//                .attribute(.tabindex, value: Unit.Dimention.int(0))
//
//                .onKeyDown { char in
//                    print("pressed: \(char)")
//                }
//
//                .onClick {
//                    print("clicked whats up:")
//                }
//
//            // @Route(name: "#hello")
//            Button("HI: \(thing)")
//                .style(
//                    .backgroundColor(bgc),
//                    .width(.px(100))
//                )
//                .onClick {
//                    print("YO")
//                    self.hello += 1
//                }
//
//
//            Input($thing)
//                .onBlur {
//                    print("BLURRED: thing")
//                }
//            InnerPage(hello: $hello)
//                .onBlur {
//                    print("blur inner")
//                }
//                .onClick {
//                    print("pressed inner")
//                }
//
//            Div {
//                Div("my string is: \(Double(hello) * 1.5)")
//            }
//            .style(
//                .backgroundColor(bgc),
//                .width(.px(100))
//            )
//            .onMouseOver {
//                print("OVER HERE")
//                self.bgc = .rgb(200,0,0)
//            }
//            .onMouseOut {
//                print("OUT HERE")
//                self.bgc = .rgb(0,200,0)
//            }
//        }
//        // TODO: allow for css files
//        // .style(
//        //     location: "Sheets/global.css"
//        // )
//    }
//}

struct HeyPage: Page {
    @State var hey = 2
    @State var blud = true
    @State var buddy = "suspicioous"

    var body: some Page {
        Div {
//            Div("HELLO \(hey)")

//            Div("HELLO\(hey)")
//            Div("HELLO\(hey)")
            
            Div("HELLO")
//                .style(
//                    .backgroundColor(.rgb(200, 200, 0))
//                )

//                .onClick {
//                    hey += 1
//                }
        }
    }
}

struct TestTwoPage: Page {
    
    @State var hello: Int = 0
    @State var color: Unit.Color = .rgb(0, 200, 0)

    @State var inputstring: String = "Starting"

    var body: some Page {
        Div {
            Div("BR \(hello) years old")
//            Div("BR \(hello) years old")
            .style(
                .backgroundColor(color)
            )

            if hello % 2 == 0 {
                HeyPage()
                    
                //                InnerPage(hello: $hello)
                //                Div("AN \(hello) years old")
                //                Div("CS \(hello) years old")
                //                Div("BS \(hello) years old")

            }
//                Div("LL \(hello) years old")
            
//            } else {
//                Input($inputstring)
//
//            }
            
//            InnerPage(hello: $hello)
            
//            Input($inputstring)

            Button("Press me anywhere")
                .style(
                    .backgroundColor(.rgb(0, 200, 0))
                )
                .onMouseOut {
                    color = color == .rgb(0, 200, 0) ? .rgb(200, 0, 200) : .rgb(0, 200, 0)
                    hello += 1
                }
//                .onClick {
//                    hello += 1
//                }
       }
        .style(
            .backgroundColor(.rgb(0, 0, 200))
       )
   }

}


//@Route("\about")
struct Hey1Page: Page {
    @State var hello: Int = 1

    var body: some Page {
        Div {
            Div("hello: \(hello)")
                .onClick {
                    hello += 1
                }
        }
    }
}

struct Hey2Page: Page {
    @State var myName: Int = 0

    var body: some Page {
        Div {
            
            if myName % 2 == 1 {
                Hey1Page()
            }
            
            Div("HELLO: \(myName)")
                .style(.backgroundColor(.rgb(200, 0, 0)))

            Div {
                Div("SO: \(myName)")
                
                Div("Y: \(myName)")
                Div("OH: \(myName)")

            }
            .onClick {
                myName += 1
            }
            .onMouseOver {
                
            }
            

            Span("world")

        }
    }
}

App.build(root: Hey2Page())
