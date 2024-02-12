import Sailor
import JavaScriptKit

struct AboutPage: Page {
    @State var myNum: Int = 0
    @State var myString: String = ""
    let source = "https://img.freepik.com/free-photo/isolated-happy-smiling-dog-white-background-portrait-4_1562-693.jpg"
    
    var body: some Page {
        Div {
            Div(myString)
            SubPage1(myString: $myString)
        }
    }
}

struct SubPage1: Page {
    @State var myNum: Int = 1
    @Binding var myString: String
    
    let source = "https://img.freepik.com/free-photo/isolated-happy-smiling-dog-white-background-portrait-4_1562-693.jpg"
    
    var body: some Page {
        Div {
            
            H1("This is a \(myString)")
            H2("subtitle")
            
            Button("hey candy")
                .onClick {
                    myString = "mine bruh"
                }

//            if myNum % 2 == 0 {
//                Div("This number is \(myNum)")
//            }
            
            Input($myString)
            
//            Img(src: source, alt: source)
//                .classes("my-class")
//
//            Img(src: source, alt: source)
            
            
//            Div("WHO AM I")
//                .wind(
//                    .p10, .m0, .w64, .h64,
//                    .hover(.bgBlack)
////                    .sm(.mx0, .p10, .m0),
////                    .md(.p10, .m0),
////                    .lg(.p10, .m0)
//                )
//
//            Button("this is a button")
//                .onClick {
//                    print("I was clicked")
//                    myNum += 1
//                }
        }
    }
}
