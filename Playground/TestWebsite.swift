import Sailor
import JavaScriptKit

@main
struct TestWebsite: Website {
    typealias WebRoutes = MyRoutes
  
    var body: some Page {
        Div {
            NavBar()
            Router {
                Route<MyRoutes>(.about) {
                    AboutPage()
                }
                
                Route<MyRoutes>(.explore) {
                    Div("explore we go")
                }
                
                Route<MyRoutes>(.home) {
                    HomePage()
                }
            }
        }
    }
}

enum MyRoutes: Routes {
    static var getRoot: Self { .home }
    
    case home, about, explore
    
    var description: String {
        switch self {
        case .home:
            return "/"
        case .about:
            return "about"
        case .explore:
            return "explore"
        }
    }
}

struct NavBar: Page {
    @Environment(\.navigation) var navigation: Navigation<MyRoutes>
    
    var body: some Page {
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
