import Sailor
import JavaScriptKit


let window = JSObject.global.window

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
//                .attribute(.height(100))
                .onClick {
                    num += 1
                }
        }
    }
}

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
//                    window.location.replace("http://localhost:8080/#about")
//                    SailboatGlobal.manager.update()
//                    window.history.pushState(stateObj,
//                                    "Page 2", "/page2.html");
                    
                    
                    myNum += 1
                    print("pressed")
                    let state = JSValue.null //JSObject.global.Object.new()
                    let title = JSValue.string("New Page Title")
                    let url = JSValue.string("/new-url") // Make sure the URL is valid for your application's routing
                    print("after")

                    // Access `pushState` directly as a function on `history`
                    if let pushState = window.history.pushState.function {
                        pushState(state, title, url)
                    } else {
                        print("Failed to access pushState function")
                    }
                }
        }
    }
    
}
