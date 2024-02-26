import Sailor

@main
struct TestWebsite: Website {
    // TODO: make it so i need environment not typealias?
    typealias WebRoutes = AppRoutes
    
    @Environment var environment: WebEnvironment<AppRoutes>
    
    init() {
        // TODO: things that are global added/modify like this
        environment.favicon("resources/favicon.ico")
//        environment.title("My Test App")
        
        // TODO: somehow push and pop environment on with things that are pushed
//        environment.add(
//            .link("resources/Global.css"),
//            .title("My Test App")//,
////            .favicon("resources/favicon.ico")
//        )
    }
    
// TODO: do this under the hood
//    deinit {
//        environment.pop()
//    }
  
    var body: some Page {
        Div {
            NavBar()
            
            Div("ROUTE: \(environment.navigation.route.description)")
            
            Router {
                Route(.Root) {
                    HomePage()
                }

                Route(.about) {
                    AboutPage()
                }

                Route(.explore) {
                    Div("explore we go")
                        .onClick {
                            alert("hello im alert")
                        }
                    Img(src: "", alt: "")
                }
            } notFound: {
                NotFoundPage()
            }
        }
    }
}

struct NavBar: Page {
    // TODO: fix the weird generics expected by the environment variables
//    @Navigator(\.navigation) var navigation: Navigation<AppRoutes>
    @Environment(\.navigation) var navigation: Navigation
    @Environment(\.url) var url

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
