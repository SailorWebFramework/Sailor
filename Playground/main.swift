import Sailor

struct InnerPage: Page {
    var attributes: Attributes = [:]

    @Binding var hello: Int

    var body: some Page {
        Div {
            Div("Yo Whats UP!! Im \(hello) years old")
            Div("Press me anywhere")
        }
        .style(.backgroundColor(.rgb(200, 0, 0)))
    }

    func onClick(_ completion: @escaping () -> Void) -> any Page {
        self.body.onClick {
            completion()
        }
    }
    
}

struct TestPage: Page {
    var attributes: Attributes = [:]

    @State var hello = 0
    @State var bgc: Unit.Color = .rgb(0,0,200)
    @State var thing: String = ""

    var body: some Page {
        Div {
            Span("Yo Whats UP!!")
                // TODO: make this better somehow?
                // .attribute(.tabindex(.int(0))) // probably this
                .attribute(.tabindex, value: Unit.Dimention.int(0))

                .onKeyDown { char in
                    print("pressed: \(char)")
                }
            
            Button("HI: \(thing)")
                .style(
                    .backgroundColor(bgc),
                    .width(.px(100))
                )
                .onClick {
                    print("YO \(hello)")
                    self.hello += 1
                }

            Input($thing)

            InnerPage(hello: $hello)
                // .onClick {
                //     print("pressed inner")
                // }

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
    }
}


App.initialize(root:TestPage())
App.build()
