import Sailor 
struct NotFoundPage: Page {
//    @Navigator(\.navigation) var navigation: Navigation<AppRoutes>
//    @Environment(\.navigation) var navigation: Navigation<AppRoutes>

    var body: some Page {
        Div {
            Div{"404"}
            Div{"Page not found"}
            Button{"Go to home"}
//                .onClick {
//                    navigation.go(to: .home)
//                }
        }
    }
}

