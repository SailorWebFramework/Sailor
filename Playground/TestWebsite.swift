import Sailor
import JavaScriptKit

@main
struct TestWebsite: Website {
    
    //TODO: make environment stuff here replace Config
    //TODO: make routing through environment
    var env: Environment {
        
        Environment()
//        Environment(
//            vars: loadDotEnv(),
//            modules: [
//                Tailwind.Module()
//            ],
//            metadata: [
//                "title": "Test Website",
//                "description": "This is a test website"
//            ]
//        )
////        .vars(loadDotEnv())
//        .link(rel: "stylesheet", href:"Sailor_Playground.resources/Global.css")
        
    }

    @State var location: Location = .home

    var body: some Page {
        Div {
            NavBar(location: $location)
            Router {
                // TODO: make routes take in enum values
                Route("about") {
                    Div("about time XD")
                }
                
                Route("explore") {
                    Div("dora explorer we go")
                }
                
                Route("/") {
                    Div("in the root")
                }
            }
        }

    }
}

enum Location {
    case home, about, explore
}

struct NavBar: Page {
    //TODO: this v
//    @Environment(\.nav) var nav: Environment
    @Binding var location: Location
    var body: some Page {
        Div {
            Button("About")
                .onClick {
                    location = .about
                    //TODO: make routing through environment
                    // ie: nav.navigate(.about)
                    window.location.replace("http://localhost:8080/about")

                }
            Button("Home")
                .onClick {
                    location = .home
                    // ie: nav.navigate()
                    window.location.replace("http://localhost:8080/")

                }
            Button("Exlore")
                .onClick {
                    location = .explore
                    // ie: nav.navigate(.explore)
                    window.location.replace("http://localhost:8080/explore")

                }
        }
    }
}
