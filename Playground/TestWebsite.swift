import Sailor

#if os(WASI)
@main
#endif
struct TestWebsite: Website {
    @Environment var environment: Env
    
    var body: some Page {
        Body {
            H1 { environment.url }
            HomePage()
        }
        .head {
            Title { "This is a title" }
            Link(rel: "stylesheet", href: "sheet3.css")
            Link(rel: "icon", href: "favicon.ico")
        }
    }
}

// TODO: vvvv
// Make custom properties for FavIcon and LinkCSS
//            FavIcon("resources/icon.ico")
//            LinkCSS("sheet1.css")

//struct NavBar: Page {
//    // TODO: fix the weird generics expected by the environment variables
////    @Navigator(\.navigation) var navigation: Navigation<AppRoutes>
//    
////    @State var hello: Int = 0
//    @Environment(\.navigation) var navigation: Navigation
//    @Environment(\.url) var url
//
//    var body: some Page {
//        Div {
//            Div{"URL: \(url)"}
//            Div {
//                Button{"About"}
//                    .onClick {
//                        navigation.go(to: .about)
//                    }
//                Button{"Home"}
//                    .onClick {
//                        navigation.go(to: .home)
//                    }
//                Button{"Exlore"}
//                    .onClick {
//                        navigation.go(to: .explore)
//                    }
//            }
//        }
//    }
//}



//            Router {
//
//                Route(.defaultRoute) {
//                    HomePage()
//                }
//
//                Route(.about) {
//                    Div{"about we go?"}
//
//                }
//
//                Route(.explore) {
//                    Div{"explore we go?"}
//                }
//
//            } notFound: {
//                NotFoundPage()
//            }
            //            Link(rel: "stylesheet", href:"Sailor_Playground.resources/Global.css")

            //            NavBar()
                        
//                        Div{"\(environment.url.description)"}
                        
