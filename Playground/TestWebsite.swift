import Sailor
//#if os(WASI)

//#endif
@main
struct TestWebsite: Website {
    @Environment var environment: Env
    
    var head: Head {
        .init()
    }
//    Head {
//        Title { "This is a title" }
//        Link(rel: { "stylesheet" }, href: { "Sailor_Playground.resources/hello.css" })
//        Link(rel: { "stylesheet" }, href: { "Sailor_Playground.resources/Global.css" })
//        Link(rel: { "icon" }, href: { "favicon.ico" })
//    }
    
    var body: Body {
        Body {
            H1 { environment.url }
            HomePage()
        }
        .onAppear {
            print("BUILT Starting App...")
        }
    }
}
