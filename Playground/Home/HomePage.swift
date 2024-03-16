import Sailor

struct HomePage: Page {

    @State var myNum: Int = 6
    @State var myString: String = ""

    @State var toggle: Bool = true
    
    let source = "https://img.freepik.com/free-photo/isolated-happy-smiling-dog-white-background-portrait-4_1562-693.jpg"

    var body: some Page {
        Div {
            H2{ "IM HERE" }
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
            }
            
            
            H4{ "HELLO ME" }

//            Div {
//                "hello this is a test"
//                " did it combine?"
//            }
//            
//            Input($myString)
//            
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
                   
