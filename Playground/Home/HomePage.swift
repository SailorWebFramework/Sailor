import Sailor
import JavaScriptKit


let window = JSObject.global.window

struct HomePage: Page {
    @State var myNum: Int = 0
    @State var toggle: Bool = true
    
//    override func env(_ environment: Environment) -> Environment {
//        environment
//            .title("THis is my title")
//            .link(rel: "stylesheet", href:"Sailor_Playground.resources/Global.css")
//    }
    let source = "https://img.freepik.com/free-photo/isolated-happy-smiling-dog-white-background-portrait-4_1562-693.jpg"

    var body: some Page {
        Div {
            Link(rel: "stylesheet", href:"Sailor_Playground.resources/Global.css")
            Img(src: "Sailor_Playground.resources/favicon.ico", alt: "icon picture")
//                .classes("m-0 sm:w-64 sm:h-64 m-0 shadow-lg rounded-lg")
//                .classes("w-12 h-12 lg:w-32 lg:h-32")

                .wind(
                    .m0, .w64, .h64, .m0, .shadowLg,
                    .animateSpin,
                    .sm(.p10, .bgBlue50),
                    .lg(.p20, .bgRed100)
                )
            
            Img(src: source, alt: "icon picture")

//                .wind(
//                    .m0
//                )
        }
        .wind(
            .m0, .p10
        )
        
//        .classes("p-10")
//        .environment {
//            $0
//            .title("THis is my title")
//            .link(rel: "stylesheet", href:"Sailor_Playground.resources/Global.css")
//
//        }
    }
    
    //
    //            if myNum % 4 == 0 {
    //                Div {
    //                    Div("Second Lower!")
    //                    Div("Another Lower!")
    //
    //                    if toggle {
    //                        Div("HEY IM HERE")
    //                            .wind(
    //                                .p10
    //                            )
    //                    }
    //
    //                    Button("Press ME: \(toggle)")
    //                        .onClick {
    //                            toggle.toggle()
    //                        }
    //                }
    //            } else {
    //                Div("THIRD Lower!")
    ////                .style(
    ////                    .backgroundColor(myNum % 4 == 0 ? .rgb(0, 0, 200) : .rgb(0, 200, 0))
    ////                )
    //            }
    //
    //            Button("Press this button: \(myNum)")
    //                .onClick {
    ////                    window.location.replace("http://localhost:8080/#about")
    ////                    SailboatGlobal.manager.update()
    ////                    window.history.pushState(stateObj,
    ////                                    "Page 2", "/page2.html");
    //
    //
    //                    myNum += 1
    //                    print("pressed")
    //                    let state = JSValue.null //JSObject.global.Object.new()
    //                    let title = JSValue.string("New Page Title")
    //                    let url = JSValue.string("/new-url") // Make sure the URL is valid for your application's routing
    //                    print("after")
    //
    //                    // Access `pushState` directly as a function on `history`
    //                    if let pushState = window.history.pushState.function {
    //                        pushState(state, title, url)
    //                    } else {
    //                        print("Failed to access pushState function")
    //                    }
    //                }
    
}
