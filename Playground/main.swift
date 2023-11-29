import Sailor

struct InnerPage: Page {
    var attributes: Attributes = [:]

    @Binding var hello: Int

    var body: some Page {
        Div {
            Div("Yo Whats UP!! Im \(hello) years old")
            Div("Press me anywhere")
        }
        .style(
            .backgroundColor(.rgb(200, 0, 0)),
            .display(.inlineBlock)
        )
    }
    
}

// @Route(name: "home")
struct TestPage: Page {
    var attributes: Attributes = [:]

    @State var hello = 0
    @State var bgc: Unit.Color = .rgb(0,0,200)
    @State var thing: String = ""

    var body: some Page {
        Div {

            if hello == 5 {
                Div("Yo")
            } else {
                Div("Yo")
                Div("Yo")
                Div("Yo")

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
            // InnerPage(hello: $hello)
            //     .onBlur {
            //         print("blur inner")
            //     }
            //     .onClick {
            //         print("pressed inner")
            //     }

            // Div {
            //     Div("my string is: \(Double(hello) * 1.5)")
            // }
            // .style(
            //     .backgroundColor(bgc),
            //     .width(.px(100))
            // )
            // .onMouseOver {
            //     print("OVER HERE")
            //     self.bgc = .rgb(200,0,0)
            // }
            // .onMouseOut {
            //     print("OUT HERE")
            //     self.bgc = .rgb(0,200,0)
            // }
        }
        // TODO: allow for css files 
        // .style(
        //     location: "Sheets/global.css"
        // )
    }
}


App.initialize(root: TestPage())
App.build()
