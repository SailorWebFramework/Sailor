import Sailor

@main
struct TestWebsite: Website {
    var body: some Page {
        HomePage()
    }
    
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
