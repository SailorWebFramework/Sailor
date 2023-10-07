import XCTest
@testable import Sailor

// This is how you add a custom attribute
extension Attribute {
    static var hello: Self = .custom("hello")
}

//@Stateless
struct TestPage: Page {
    // TODO: might be cool to add this to global state
    var attributes: Attributes = [.src: "www.google.com", .hello: "whats up"]
    
    var hello: [String] = ["andy", "chris", "vaishak"]
    
    var body: some Page {
        Div {
            if let src = attributes[.src] {
                Img(src: src.render())
                Span("Hello WORLD")
            }
            
            if let hello = attributes[.hello] {
                Span(hello.render())
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
                                        
            TestPage()
                .attribute(.hello, value: "HELLOOOOO")

        )
        
        //TODO: MAKE A GENERIC BUILD FOLDER FOR TESTING?
        let fileManager = FileManager.default
        let loc = URL(fileURLWithPath: "/Users/joshuadavis/Downloads/build/index.html")
        hierarchy.build(loc: loc)
        
    }
}
