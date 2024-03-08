import Sailor

struct AboutPage: Page {
    @State var myNum: Int = 0
    @State var myString: String = ""
    @State var url: String = ""

    let source = "https://img.freepik.com/free-photo/isolated-happy-smiling-dog-white-background-portrait-4_1562-693.jpg"
    
    var body: some Page {
        Div {
            Div(myString)
            SubPage1(myString: $myString)
            Button("click me")
                .onClick {
                    myNum += 1
                }
            H3("num: \(myNum)")
//
            
//            Div{ myString }
//            SubPage1(myString: $myString)
//            Button{"click me"}
//                .onClick {
//                    myNum += 1
//                }
//            H3{"num: \(myNum)"}
            
            
//            A(href: "www.mysite.com")
            
//                .href{"www.google.com"}
//                .alt{"this is a link"}
            
            
        }
    }
}

struct SubPage1: Page {
    @State var myNum: Int = 1
    @Binding var myString: String
    
    let source = "https://img.freepik.com/free-photo/isolated-happy-smiling-dog-white-background-portrait-4_1562-693.jpg"
    
    var body: some Page {
        Div {
            A("CLICK").href("#Hello")
            H1("This is a \(myString)")
            H2("subtitle")
            
            Button("hey candy")
                .onClick {
                    myString = "mine bruh"
                }

            Input($myString)
                .id("Hello")
     
        }
    }
}
