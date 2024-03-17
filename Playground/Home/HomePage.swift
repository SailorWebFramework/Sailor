import Sailor

struct HomePage: Page {

    @State var myNum: Int = 6
    @State var myString: String = ""

    @State var toggle: Bool = true
    
    let source = "https://img.freepik.com/free-photo/isolated-happy-smiling-dog-white-background-portrait-4_1562-693.jpg"

    var body: some Page {
        Div {
            H2{ "IM HERE" }
                .id("hellounique")
                .onClick {
                    toggle.toggle()
                }
            // TODO: not removing correctly
            if toggle {
                H1 { "Hello world!" }
                    .onClick {
                        toggle.toggle()
                    }
            } else {
                H3 { "SMallerworld" }
                    .onClick {
                        toggle.toggle()
                    }
                
                H3 { "SMallerworld 2" }
                    .onClick {
                        toggle.toggle()
                    }
                
                H3 { "SMallerworld 3" }
                    .onClick {
                        toggle.toggle()
                    }
            }
            
            if toggle {
                SubPageInner()
                
            }
            
            
            
            H4{ "HELLO ME" }
            
            if toggle {
                SubPageInner()
                SubPageInner()
                
            }
            
            Div {
                "hello this is a test"
                " did it combine?"
            }
            .id("jdfhjdfdhf")
            
            
            Input($myString)
            
            //            if myString == "hell" {
            //                H2{"HOMIE STOP CURSING"}
            //
            //            } else if  myString == "hello" {
            //                H4{"JKJK"}
            //
            //            } else {
            //                H3{"Empty"}
            //
            //            }
            //
            //            if myNum == 10 {
            //                A { "hello its" }
            //                    .href("#MyImage")
            //                    .onClick {
            //                        var value = prompt("IS THIS REAL")
            //
            //                        myString = value
            //                    }
            //            }
            //            else if myNum == 7 {
            //               H2{"my number: \(myNum)"}
            //
            //            }
            //            else if myNum == 8 {
            //               H2{"my number: \(myNum)"}
            //
            //            }
            //            else if myNum == 9 {
            //                H2{"my number: \(myNum)"}
            //
            //            }
            //
            //            // not working
            //            H6{"number: \(myNum)"}
            //
            //
            //            Button { "press me" }
            //                .onClick {
            //                    myNum += 1
            //                }
            //        }
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
                A { "I am a link" }
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
                   
