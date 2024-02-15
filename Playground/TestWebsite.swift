import Sailor
import JavaScriptKit

@main
struct TestWebsite: Website {
    typealias WebRoutes = AppRoutes
  
    var body: some Page {
        Div {
            NavBar()
            Router {
                Route<AppRoutes>(.NotFound) {
                    NotFoundPage()
                }
                
                Route<AppRoutes>(.Root) {
                    HomePage()
                }
                
                Route<AppRoutes>(.about) {
                    AboutPage()
                }
                
                Route<AppRoutes>(.explore) {
                    Div("explore we go")
                }
            }
        }
    }
}

enum AppRoutes: Routes {
    static var Root: Self { .home }
    static var NotFound: Self { .notFound }
    
    static var bindings: BidirectionalDictionary<Self, String> = [
        .home: "/",
        .about: "about",
        .explore: "explore",
        .notFound: "404"
    ]
    
    case home, about, explore, notFound
    
}

struct NavBar: Page {
    // TODO: fix the weird generics expected by the environment variables
//    @Navigator(\.navigation) var navigation: Navigation<AppRoutes>
    @Environment(\.navigation) var navigation: Navigation<AppRoutes>
    @Environment<AppRoutes, String>(\.url) var url

    var body: some Page {
        Div {
            Div("URL: \(url)")
            Div {
                Button("About")
                    .onClick {
                        navigation.go(to: .about)
                    }
                Button("Home")
                    .onClick {
                        navigation.go(to: .home)
                    }
                Button("Exlore")
                    .onClick {
                        navigation.go(to: .explore)
                    }
            }
        }
    }
}
