public struct Route {
    let path: String
    let page: any Page

    public init(_ path: String, _ page: () -> any Page) {
        self.path = path
        self.page = page()
    }
}