import Sailor
import JavaScriptKit

@main
struct TestWebsite: Website {
    var config: Config{
        Config(
            routes: [
                Route("/") { HomePage() },
                Route("home") { AboutPage() },
                Route("404") { NotFoundPage() }
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

