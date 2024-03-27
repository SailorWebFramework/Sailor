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
            for name in names {
                H3 { "Hi my name is \(name)" }
            }
            
            if toggle {
                H1 { "OMG you pressed the button!" }
                    .id { myString == "hello" ? "myTrue" : "myFalse" }
                    .onClick {
                        toggle.toggle()
                    }
                
                if myNum == 7 {
                    H1 { "Congrats" }
                        .onClick {
                            toggle.toggle()
                        }
                }
                
            } else {
                Button { "Press THIS" }
//                    .disabled(^toggle)
                    .onAppear {
                        print("BUTTON EXISTS")
                    }
                    .onClick {
                        toggle.toggle()
                    }
            }
                        
            if myString == "hello" {
                H4 { "HELLO ME" }
                    .id({ "hello-unique-id" })
            }

            if !toggle {
                Div {
                    "This is a string: \(myString)"
                    
                    myString
                                        
                    B {
                        "this is bolded"
                    }
                    
                    """
                    This is my other string: \(myString)
                    """
                    
                    B {
                        "this should be bold"
                    }
                }
            }
            
            Input($myString)
                .id { myString == "hello" ? "1myTrue" : "1myFalse" }

            
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
                A(href: { "www.google.com" }){
                    "I am a link"
                }
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
                   
