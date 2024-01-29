import Sailor
import JavaScriptKit

@main
struct EntryPoint {
    static func main() {
        let htmlPath = "./static/index.html"
        let htmlContent = try? String(contentsOfFile: htmlPath, encoding: .utf8)
    // JSObject.global.document.body.innerHTML = htmlContent ?? ""
    }

    // init() {
    //     let router = Router()
    //     router.delegate = self
    //     router.navigateTo(route: "/")
    // }
    
}






struct TestWebsite: Website {
    var config: Config{
        Config(
            routes: [
                Route("/") { HomePage() },
                Route("home") { AboutPage() },
            ],
            metadata: [
                "title": "Test Website",
                "description": "This is a test website"
            ]
        )
    }
    var router = Router()

    // var body: some Page {
    //     HomePage()
    // }
}

//
//struct TestWebsite: Website {
//    var routes: Routes {
//        Route("home") { HomePage() }
//        
//        Route("about") { AboutPage() }
//        
//        Route("404") { NotFoundPage() }
//    }
//    
//}
//
//
//Routes {
//    "home": HomePage()
//    "about": AboutPage()
//    "404": NotFoundPage()
//}

