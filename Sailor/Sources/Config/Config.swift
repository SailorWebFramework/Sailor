public struct Config {
    var routes: [Route]? = nil
    var metadata: [String: String]? = nil
    var root : any Page {
        routes!.first(where : { $0.path == "/" })!.page
    }

    public init(routes: [Route], metadata: [String: String]) {
        do {
            let paths = routes.map(\.path)
            guard paths.contains("/") else {
                print("Root path not found")
                throw ConfigError.noRootPath
            }
            let uniquePaths = Set(paths)
            guard paths.count == uniquePaths.count else {
                print("Duplicate paths found")
                throw ConfigError.duplicatePaths
            }
        } catch {
            fatalError("Error: \(error)")
        }
        self.routes = routes
        self.metadata = metadata
    }
}