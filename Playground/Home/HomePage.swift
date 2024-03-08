import Sailor
//import JavaScriptKit


//let window = JSObject.global.window

struct HomePage: Page {
//    @Environment(\.navigation) var navigation: Navigation<AppRoutes>

    @State var myNum: Int = 10
    @State var toggle: Bool = true
    
    let source = "https://img.freepik.com/free-photo/isolated-happy-smiling-dog-white-background-portrait-4_1562-693.jpg"

    var body: some Page {
        Div {
            Link(rel: "stylesheet", href:"Sailor_Playground.resources/Global.css")
            
            
            if myNum == 10 {
                A("hello its").href("#MyImage")
            }
            
            if toggle {
                H2("subtitle")
                
                Div {
                    "my text is this"
                }
                
//                A (href: "www.google.com", alt: "this is a photo") {
//                    "my text"
////                    H1("My title")
//
//                }
            }
            
            
//            Div {
////                Div { "hello \(name)" }
//                
//                A(href: "www.google.com", alt: "this is alt text") {
//                    "press my link \(name)"
//                }
//                
//            }
            
//            #div {
//                // with parens
//                #h1("hello \(name)")
//
//                // with func and props
//                #a(href: "www.\(name).com", alt: "this is alt text") {
//                    "press my link \(name)"
//                }
//
//                // with parens and external props funcs
//                #button("my button \(mynum)")
//                    .autofocus { true }
//                    .onClick {
//                        mynum += 1
//                    }
//            }
                            
//            Img(src: "Sailor_Playground.resources/favicon.ico", alt: "icon picture")
            Button("HELLO \(myNum)")
                .autofocus(true)
                .name("button-name")
                .classes("customclass", "customclass2")
                .onClick {
                    myNum += 1
                }
            
            Button("GOODBYE")
                .onClick {
                    toggle.toggle()
                }
            
                        
//                .classes("m-0 sm:w-64 sm:h-64 m-0 shadow-lg rounded-lg")
//                .classes("w-12 h-12 lg:w-32 lg:h-32")

//                .wind(
//                    .m0, .w64, .h64, .m0, .shadowLg,
//                    .animatePulse
////                    .sm(.p10, .bgBlue50),
////                    .lg(.p20, .bgRed100)
//                )
            
            
//            Img(src: "Sailor_Playground.resources/favicon.ico", alt: "icon picture")
//
//            Div("my num is \(myNum)")
//                .onClick {
//                    myNum += 1
//                }
//
//            Img(src: source, alt: "icon picture")
//                .onClick {
////                    navigator.navigate(to: .about)
//                }
//                .id("MyImage")

//                .wind(
//                    .m0
//                )
        }
//        .head {
//            Link(rel: "stylesheet", href: "www.stylesheet.com/mystylesheet.css")
//            
//        }
//        .wind(
//            .m0, .p10
//        )
//
//        .classes("p-10")
//        .environment {
//            $0
//            .title("THis is my title")
//            .link(rel: "stylesheet", href:"Sailor_Playground.resources/Global.css")
//
//        }
    }
    
}
