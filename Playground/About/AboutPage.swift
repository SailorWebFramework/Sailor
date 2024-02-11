import Sailor

struct AboutPage: Page {
    @State var myNum: Int = 0
    @State var myString: String = ""
    let source = "https://img.freepik.com/free-photo/isolated-happy-smiling-dog-white-background-portrait-4_1562-693.jpg"
    
    var body: some Page {
        Div {
            SubPage1(myString: $myString)
            
            Div(myString)
        }
    }
}

struct SubPage1: Page {
    @State var myNum: Int = 1
    @Binding var myString: String
    
    let source = "https://img.freepik.com/free-photo/isolated-happy-smiling-dog-white-background-portrait-4_1562-693.jpg"
    
    var body: some Page {
        Div {
            H1("This is a \(myString) title")
            H2("subtitle")

            if myNum % 2 == 0 {
                Div("This number is \(myNum)")
            }
            
            Input($myString)
            
//            for i in 0..<myNum {
//                Div("I am josh")
//            }
            
            Img(src: source, alt: source)
                .classes("my-class")
            
            Img(src: source, alt: source)
//                .style()
//                .wind( .mx_0, .p_10, .m_0 )
                .wind(.mx0, .p10, .m0)
            
                .wind(
                    .mx0, .p10, .m0
//                    .sm(.mx0, .p10, .m0),
//                    .md(.p10, .m0),
//                    .lg(.p10, .m0)
                )

            Button("this is a button")
                .onClick {
                    print("I was clicked")
                    myNum += 1
                }
        }
    }
}
