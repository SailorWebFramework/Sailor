import Sailor

struct HomePage: Page {

    @State var myNum: Int = 10
    @State var toggle: Bool = true
    
    @State var num2: Int = 0
    
    let source = "https://img.freepik.com/free-photo/isolated-happy-smiling-dog-white-background-portrait-4_1562-693.jpg"

    var body: some Page {
        Div {
//            Link(rel: "stylesheet", href: "Sailor_Playground.resources/hello.css")
            
//            SubPageInner()
            
            Div {
                "hello this is a test"
                "did it combine?"

            }
                        
            if myNum == 10 {
                A { "hello its" }
                    .href("#MyImage")
            }
            
            if toggle {
                H2 { "subtitle" }
                Div { "more text!" }
                
//                A (href: "www.google.com", alt: "this is a photo") {
//                    "my text"
////                    H1("My title")
//
//                }
            }
            
            
//            Dizv {
////                Div { "hello \(name)" }
//                
//                A(href: "www.google.com", alt: "this is alt text") {
//                    "press my link \(name)"
//                }
//                
//            }
            
         
//            Img(src: "Sailor_Playground.resources/favicon.ico", alt: "icon picture")
            Button{"HELLO \(num2)"}
                .onClick {
                    num2 += 1
                    print("UP THE THING")
                }
            
            Img(src: "Sailor_Playground.resources/favicon.ico", alt: "icon picture")

        }
        .onAppear {
            print("I APPEARED")
        }
    }
}


//struct SubPageInner: Page {
//    @State var myValue: Int = 0
//    var body: some Page {
//        Div("Hello \(myValue)")
//            .onClick {
//                myValue += 1
//            }
//    }
//}


// idea with macros?
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
                   
