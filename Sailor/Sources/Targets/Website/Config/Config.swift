//public struct Config {
//    var routes: [Route]
//    var metadata: [String: String]
//    var root : any Page {
//        Div("Config todo: no root specified")
////        routes.first(where : { $0.path == "/" })!.page
//    }
//    var notFound : any Page {
//        Div("Config todo: no root specified")
////        routes.first(where : { $0.path == "404" })!.page
//    }
//
//    public init(routes: [Route], metadata: [String: String]) {
//        do {
//            let paths = routes.map(\.path)
//            guard paths.contains("/") else {
//                print("Root path not found")
//                throw ConfigError.noRootPath
//            }
//            /* maybe not needed */
//            guard paths.contains("404") else {
//                print("404 path not found")
//                throw ConfigError.no404Path
//            }
//            let uniquePaths = Set(paths)
//            guard paths.count == uniquePaths.count else {
//                print("Duplicate paths found")
//                throw ConfigError.duplicatePaths
//            }
//        } catch {
//            fatalError("Error: \(error)")
//        }
//        self.routes = routes
//        self.metadata = metadata
//    }
//
////    public func getRoute(path: String) -> (any Page) {
////        return routes.first(where: { $0.path == path })?.page ?? notFound
////        // return routes.first(where: { $0.path == path })
////    }
//
//    // public func getRoute(path: String) -> Route? {
//    //     guard let routes = self.routes else {
//    //         print("Routes not found")
//    //         return nil
//    //     }
//    //     return routes.first(where: { $0.path == path })
//    // }
//    // public func getRoutes() -> [Route]? {
//    //     guard let routes = self.routes else {
//    //         print("Routes not found")
//    //         return nil
//    //     }
//    //     return routes
//    // }
//    public func getMetadata() -> [String: String] {
//        return metadata
//    }
//}
