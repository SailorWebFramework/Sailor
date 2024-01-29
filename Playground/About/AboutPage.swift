import Sailor


//struct HeyPage: Page {
//    @State var hey = 2
//    @State var blud = true
//    @State var buddy = "suspicioous"
//
//    var body: some Page {
//        Div {
////            Div("HELLO \(hey)")
//
////            Div("HELLO\(hey)")
////            Div("HELLO\(hey)")
//            
//            Div("HELLO")
////                .style(
////                    .backgroundColor(.rgb(200, 200, 0))
////                )
//
////                .onClick {
////                    hey += 1
////                }
//        }
//    }
//}
//
struct AboutPage: Page {
   
   @State var hello: Int = 0
   @State var color: Unit.Color = .rgb(0, 200, 0)

   @State var inputstring: String = "Starting"

   var body: some Page {
       Div {
           Div("BR \(hello) years old")
//            Div("BR \(hello) years old")
           .style(
               .backgroundColor(color)
           )

           if hello % 2 == 0 {
            //    HeyPage()
                   
               //                InnerPage(hello: $hello)
               //                Div("AN \(hello) years old")
               //                Div("CS \(hello) years old")
               //                Div("BS \(hello) years old")

           }
//                Div("LL \(hello) years old")
           
//            } else {
//                Input($inputstring)
//
//            }
           
//            InnerPage(hello: $hello)
           
//            Input($inputstring)

           Button("Press me anywhere")
               .style(
                   .backgroundColor(.rgb(0, 200, 0))
               )
               .onMouseOut {
                   color = color == .rgb(0, 200, 0) ? .rgb(200, 0, 200) : .rgb(0, 200, 0)
                   hello += 1
               }
//                .onClick {
//                    hello += 1
//                }
      }
       .style(
           .backgroundColor(.rgb(0, 0, 200))
      )
  }

}

