import Sailor

struct AboutPage: Page {
    @State var myNum: Int = 0
    
    let source = "https://img.freepik.com/free-photo/isolated-happy-smiling-dog-white-background-portrait-4_1562-693.jpg"
    
    var body: some Page {
        Div {
            H1("This is my title")
            Div("This is the about page")
            
            Div(
//                .className("hello"),
//                .title("main-container"),
//                .data("test", "i am on the page"),
//                .id("UNIQUE123")
            ) {
                A("hyperlink").href("https://www.google.com")
                
//                Ol {
//                    Div("hello")
//                    Div("ots")
//                    Div("me")
//                }
                Img(src: source, alt: source)

            }
            .style(
                .backgroundColor(.rgb(100, 40, 100))

//                .backgroundColor(myNum % 4 == 0 ? .rgb(100, 0, 100) : .rgb(0, 100, 100)),
//                .width(.int(100))
            )
            .onClick {
                print("I was clicked")
            }
        }
    }
}
