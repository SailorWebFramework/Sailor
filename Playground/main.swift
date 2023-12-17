import Sailor

struct InnerPage: Page {
    var attributes: Attributes = [:]

    @Binding var hello: Int

    var body: some Page {
        Div {
            Div {
                Div("Yo Whats UP!! Im \(hello) years old")
                Div("Press me anywhere")
                
                Div("Press me anywhere")
                Div {
                    Div("Yo Whats UP!! Im \(hello) years old")
                    Div("Press me anywhere")
                    
                    Div("Press me anywhere")

                }
                .style(
                    .backgroundColor(.rgb(0, 200, 0)),
                    .display(.inlineBlock)
                )
            }
            .style(
                .backgroundColor(.rgb(200, 0, 0)),
                .display(.inlineBlock)
            )
        }
    }
    
}



//@StaticHTML
//@NoAttributes
//@main
//struct Test2Page: Page {
//    var attributes: Attributes = [:]
//
//    @Binding var hello: Int
//
//    var body: some Page {
//        Div {
////            @Route(name: "home")
//            InnerPage(hello: self._hello)
//
////            @Route(name: "testroute")
//            Div("Yo Whats UP!! Im \(hello) years old")
//
////            @Route(name: "thirdRoute")
//            Div("Press me anywhere")
//        }
//        .style(
//            .backgroundColor(.rgb(200, 0, 0)),
//            .display(.inlineBlock)
//        )
//    }
//
//}

struct TestPage: Page {
    var attributes: Attributes = [:]

    @State var hello = 0
    @State var bgc: Unit.Color = .rgb(0,0,200)
    @State var thing: String = "HEY PLACEHOLDER"

    var body: some Page {
        Div {
            Div("HEYO")
            Div("TEST")
            
            List([
                Div("HEYO \(hello)"),
                Div("HEYO \(hello+1)"),
                Div("HEYO \(hello+2)"),
                Div("HEYO \(hello+3)")
            ])

            if hello > 1 && hello < 10 {
                Div("Yo")
                Div("Yo")
                Div("Yo")
            } else {
                Div("hey")
            }

            Span("Yo Whats UP!! \(hello)")
                // TODO: make this better somehow?
                // .attribute(.tabindex(.int(0))) // probably this
                .attribute(.tabindex, value: Unit.Dimention.int(0))

                .onKeyDown { char in
                    print("pressed: \(char)")
                }

                .onClick {
                    print("clicked whats up:")
                }
            
            // @Route(name: "#hello")
            Button("HI: \(thing)")
                .style(
                    .backgroundColor(bgc),
                    .width(.px(100))
                )
                .onClick {
                    print("YO")
                    self.hello += 1
                }
            

            Input($thing)
                .onBlur {
                    print("BLURRED: thing")
                }
            InnerPage(hello: $hello)
                .onBlur {
                    print("blur inner")
                }
                .onClick {
                    print("pressed inner")
                }

            Div {
                Div("my string is: \(Double(hello) * 1.5)")
            }
            .style(
                .backgroundColor(bgc),
                .width(.px(100))
            )
            .onMouseOver {
                print("OVER HERE")
                self.bgc = .rgb(200,0,0)
            }
            .onMouseOut {
                print("OUT HERE")
                self.bgc = .rgb(0,200,0)
            }
        }
        // TODO: allow for css files 
        // .style(
        //     location: "Sheets/global.css"
        // )
    }
}

struct TestTwoPage: Page {
    
    @State var hello: Int = 0
    @State var inputstring: String = "Starting"

    var body: some Page {
        Div {
            Div("Im \(hello) years old")
            Div("Im \(hello) years old")
            if hello > 5 && hello < 10 {
                Div("Im \(hello) years old")
                Div("Im \(hello) years old")
            } else {
                Input($inputstring)
            }
            
            Input($inputstring)

            Button("Press me anywhere")
                .style(
                    .backgroundColor(.rgb(0, 200, 0))
            )
            .onClick {
                hello += 1
            }
       }
   }

}

App.initialize(root: TestPage())
App.build()
