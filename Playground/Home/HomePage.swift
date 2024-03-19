import Sailor

struct HomePage: Page {

    @State var names: [String] = ["Josh", "Andy", "Tom"]

    @State var myNum: Int = 7
    @State var myString: String = ""

    @State var toggle: Bool = false
    
    @Environment var environment: Env

    let source = "https://img.freepik.com/free-photo/isolated-happy-smiling-dog-white-background-portrait-4_1562-693.jpg"

    var body: some Page {
        Div {
            Title { "hello" }

            H3 { "Hi my name is \(myString)" }
            
            if toggle {
                H1 { "Hello world!" }
                    .onClick {
                        toggle.toggle()
                    }
                
                if myNum == 7 {
                    H1 { "Hello world!" }
    
                        .onClick {
                            toggle.toggle()
                        }
                }
                
            } else {
                H3 { "SMallerworld" }
                    .onClick {
                        toggle.toggle()
                    }
            }
            
            H4 { "HELLO ME" }
            
            Div {
                "hello this is a test"
                " did it combine?"
            }
            .id{"jdfhjdfdhf"}
            
            
            Input($myString)
            
        }
        .head {
            Link(rel: {""}, href: {"HomePage.css"})
        }
    }
}


struct SubPageInner: Page {
    @State var myValue: Int = 0
    var body: some Page {
        Div {
            Div { "Hello \(myValue)" }
                .onClick {
                    myValue += 1
                }
            
            if myValue % 2 == 0 {
                A({ "I am a link" })
            }
            
            if myValue % 2 == 0 {
                SubPageInner2()
            }
            
        }
    }
}


struct SubPageInner2: Page {
//    @State var myValue: Int = 0
    var body: some Page {
        Div {
            H1 { "SUBPAGEINNER2" }
            H1 { "SUBPAGEINNER2" }

        }
    }
}


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
                   
