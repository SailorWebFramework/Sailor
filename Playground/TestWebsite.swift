import Sailor

#if os(WASI)
@main
#endif

struct TestWebsite: Website {
    @Environment var environment: Env
    
    var head: Head {
        Head {
//            Title { "This is a title" }
//            Link(rel: "stylesheet", href: "Sailor_Playground.resources/hello.css")
//            Link(rel: "stylesheet", href: "Sailor_Playground.resources/Global.css")
//            Link(rel: "icon", href: "favicon.ico")
        }
    }
    
    var body: Body {
        Body {
            H1 { environment.url }
            HomePage()
//                .head {
//                    Link(rel: "", href: "AHb.css")
//                }
        }
        .onAppear {
            print("Starting App...")
        }
    }
}
