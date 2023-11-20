//import testsLibrary
import Sailor
import JavaScriptKit
import JavaScriptEventLoop


struct TestPage: Page {
    var attributes: Attributes = [:]

    var body: some Page {
        Div {
            Span("HI")
                .style(
                    .backgroundColor(.rgb(255,0,0)),
                    .width(.px(100))
                )
            Span("YOOOOOOOO")
            Span("HI")
            Span("HI")
            Span("HI")
            Span("HI")
            Span("HI")
            Span("HI")
            Span("HI")
            Span("HI")
            Span("HI")

            Div {
                Span("HI")
                Span("HI")
                Div("HELLLOOO")
                Span("HI")
            }
                .style(
                    .backgroundColor(.rgb(255,0,0)),
                    .width(.px(100))
                )
        }
    }
}

let ph = PageHierarchy(root: TestPage())
App.set(ph)

ph.build(parent: App.document.body)
