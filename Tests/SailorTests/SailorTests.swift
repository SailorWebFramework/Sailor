import XCTest
@testable import Sailor

//struct InnerCustomPage: Page {
//    var attributes: Attributes = [:]
//
//    @State var hello: Int = 0
//
//    var body: some Page {
//        Div{
//            // if src was passed down
//            if let src = attributes[.src] {
//                Span(src.description)
//                Img(src: src)
//            } else {
//                let defaultURL = "www.defaulturlimage.com"
//                Span(defaultURL)
//                Img(src: defaultURL)
//            }
//        }
//    }
//}

// TODO: routing
//@Stateless
//@Route("home")
//@StatelessRoute("")
//@Stateful
//struct TestPage: Page {
//    // TODO: might be cool to add this to global state
//    var attributes: Attributes = [.src: "www.google.com", .alt: "whats up"]
//
////    var hello: [Unit.Color] = [.rgb(255, 0, 0), .rgb(255, 0, 0), .rgb(255, 0, 0)]
//
//    var body: some Page {
//        Div {
//
//            List()
//
//            if let src = attributes[.src] {
//                Img(src: src)
//                Span("Hello WORLD")
//            }
//
//            if let hello = attributes[.alt] {
//                Span(hello.description)
//            }
//
//            Div {
//                Div {
//                    Span("HI")
//                    Span("HI")
//                    Span("HI")
//                    Span("HI")
//                    Span("HI")
//                    Span("HI")
//                    Span("HI")
//                    Span("HI")
//                    Span("HI")
//                    Span("HI")
//                    Span("HI")
//
//                }
//                Span("Hey")
//            }
//
//            InnerCustomPage()
////                .onClick {
////                    sdjfkksdf
////
////                    dfdkf
////                }
//
////            List(
////                hello.map { _ in
////                    Div {
////                        Span("hii")
////                    }
////                    .style(.backgroundColor(.rgb(255, 0, 0)))
////                }
////            )
//        }
//    }
//}

final class SwiftSailorTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
//        XCTAssertEqual(SwiftSailor().text, "Hello, World!")
        
//        App.set(PageHierarchy(root: TestPage()))
//
//        let currentFileURL = URL(fileURLWithPath: #file)
//        if #available(macOS 13.0, *) {
//            let loc = currentFileURL.deletingLastPathComponent()
//                .deletingLastPathComponent()
//                .appending(path: "Resources")
//
//            print("LOC:", loc)
////            App.build(loc: loc)
//        } else {
//            // Fallback on earlier versions
//
//            print("UPDATE IG?")
//        }
        

        // TODO: this would add all event listeners to the state should run with wasm
//        App.start()
        
    }
}
