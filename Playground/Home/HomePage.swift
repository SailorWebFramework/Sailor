import Sailor

struct HomePage: Page {

    @State var myNum: Int = 10
    @State var myString: String = ""

    @State var toggle: Bool = true
    
//    @Navigation var navigation: Navigation<MyRoutes>

//
//    @State var num2: Int = 0
    
    let source = "https://img.freepik.com/free-photo/isolated-happy-smiling-dog-white-background-portrait-4_1562-693.jpg"

    var body: some Page {
        Div {
            Div {
                "hello this is a test"
                " did it combine?"
            }
                        
            if myNum == 10 {
                A { "hello its" }
                    .href("#MyImage")
                    .onClick {
                        var value = prompt("IS THIS REAL")
                        
                        myString = value
                    }
            }
            
//
//            if toggle {
//                H2 { "subtitle" }
//                Div { "more text!" }
//            }
//            P {
//                "HELLO \(toggle)"
////                B{ "bolded text" }
////                "hello"
//            }
            
            Input($myString)
            Button{"btn \(toggle)"}
                .onClick {
                    toggle.toggle()
                    myNum += 1
                    print("TOGGLE THE THING")
                }
            
            
            Div{"title \(!toggle)"}

            
            H2{"my number: \(myNum)"}

            
            H3{"you typed: \(myString)"}
                .id("MyImage")

            
//            Img(src: "Sailor_Playground.resources/favicon.ico", alt: "icon picture")

        }
//        .onAppear {
//            print("I APPEARED")
//        }
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
                   
