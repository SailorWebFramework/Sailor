import Sailor

struct AboutPage: Page {
    @State var myNum: Int = 0
    var body: some Page {
        Div {
            Div("This is the about page")
            
            Div(
                .className("hello"),
                .title("main-container"),
                .data("test", "i am on the page"),
                .id("UNIQUE123")
            ) {
//                A(.href("https://www.google.com"){"Press me!"}
//                <a href="https://www.google.com">Press me!</a>
                A("hyperlink").href("https://www.google.com")
            }
            .style(
                .backgroundColor(.rgb(Percent(100), 40, 100)),

//                .backgroundColor(myNum % 4 == 0 ? .rgb(100, 0, 100) : .rgb(0, 100, 100)),
                .width(.int(100))
            )
            .onClick {
                print("I was clicked")
            }
        }
    }
}
