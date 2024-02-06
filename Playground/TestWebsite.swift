import Sailor
import JavaScriptKit

@main
struct TestWebsite: Website {
    var config: Config{
        Config(
            routes: [
                Route("/") { MainPageWebsite() },
                Route("404") { MainPageWebsite() },
                Route("#about") { MainPageWebsite() }
            ],
            metadata: [
                "title": "Test Website",
                "description": "This is a test website"
            ]
        )
    }
    
    @State var location: Location = .home

    var body: some Page {
        Div {
            NavBar(location: $location)
            
            switch location {
            case .home:
                HomePage()
            case .about:
                AboutPage()
            case .explore:
                Div {
                    Div("TODO: Explore page")
                }
            }
        }
    }
    var router = Router()

    // var body: some Page {
    //     HomePage()
    // }
}

struct MainPageWebsite: Page {
    @State var location: Location = .home

    var body: some Page {
        Div {
            NavBar(location: $location)
            
            switch location {
            case .home:
                HomePage()
            case .about:
                AboutPage()
            case .explore:
                Div {
                    Div("TODO: Explore page")
                }
            }
        }
    }
}


enum Location {
    case home, about, explore
}

struct NavBar: Page {
    @Binding var location: Location
    var body: some Page {
        Div {
            Button("About")
                .onClick {
                    location = .about
                }
            Button("Home")
                .onClick {
                    location = .home
                }
            Button("Exlore")
                .onClick {
                    location = .explore
                }
        }
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

