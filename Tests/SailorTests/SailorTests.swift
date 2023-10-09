import XCTest
@testable import Sailor


// depricated
// This is how you add a custom attribute
//extension Attribute {
//    static var hello: Self = .custom("hello")
//}

struct InnerCustomPage: Page {
    var attributes: Attributes = [:]
    
    @State var hello: Int = 0
    
    var body: some Page {
        Div{
            // if src was passed down
            if let src = attributes[.src] {
                Span(src.description)
                Img(src: src)
            } else {
                let defaultURL = "www.defaulturlimage.com"
                Span(defaultURL)
                Img(src: defaultURL)
            }
        }
    }
}

//@Stateless
struct TestPage: Page {
    // TODO: might be cool to add this to global state
    var attributes: Attributes = [.src: "www.google.com", .alt: "whats up"]
    
    var hello: [String] = ["andy", "chris", "vaishak"]
    
    var body: some Page {
        Div {
            if let src = attributes[.src] {
                Img(src: src)
                Span("Hello WORLD")
            }
            
            if let hello = attributes[.alt] {
                Span(hello.description)
            }
            
            hello.map {
                Span("\($0) is cool!")
                    .style(
                        .width(.px(100)),
                        .height(.px(100)),
                        .backgroundColor(.hex("#00FF00"))
                    )
            }
        }
    }
    
}


final class SwiftSailorTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
//        XCTAssertEqual(SwiftSailor().text, "Hello, World!")
        print("This should appear in the debug console")

        let hierarchy = PageHierarchy(root:
                                        InnerCustomPage()
//            TestPage()
//                .attribute(.alt, value: "HELLOOOOO")

        )
        
        //TODO: MAKE A GENERIC BUILD FOLDER FOR TESTING?
        let fileManager = FileManager.default
        let loc = URL(fileURLWithPath: "/Users/joshuadavis/Downloads/build/index.html")
        hierarchy.build(loc: loc)
        
    }
}
