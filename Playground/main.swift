import Sailor

struct TestPage: Page {
    var attributes: Attributes = [:]

    @State var hello = 0

    var body: some Page {
        Div {
            Span("Yo Whats UP!!")
                // .style(
                //     .backgroundColor(.rgb(255,0,0)),
                //     .width(.px(100))
                // )
            Div("HI its me")

            Div {
                Span("HI\n")
                Span("HI")
                Div("my number is: \(hello)")
                Span("HI")
            }
                .style(
                    .backgroundColor(.rgb(255,0,0)),
                    .width(.px(100))
                )
                .onClick {
                    print("YO \(hello)")
                    self.hello += 1
                }
        }
    }
}

let ph = PageHierarchy(root: TestPage())
App.set(ph)

ph.build(parent: App.document.body)
