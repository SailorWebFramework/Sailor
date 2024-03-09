//
//  Routes.swift
//  
//
//  Created by Joshua Davis on 2/27/24.
//

// TODO: dictionary use thing so   @Environment(\.myCustomSetting) var mySetting works?
// TODO: somehow pass it down
public protocol Routes: CustomStringConvertible, Equatable, Hashable {
//    static var getRoot: Self { get }
    var description: String  { get }

    // TODO: consider changing to v
    static var Root: Self { get }
    static var NotFound: Self { get }
    
    static var bindings: BidirectionalDictionary<Self, String> { get }
        
    static func fromString(_ str: String) -> Self
    
}

public extension Routes {
    var description: String {
        Self.bindings[key: self] ?? Self.bindings[key: Self.NotFound] ?? ""
    }
    
    static func fromString(_ str: String) -> Self {
        bindings[value: str] ?? .NotFound
    }
}

public final class Navigation<MyRoutes: Routes> {
    public var route: MyRoutes
    
    let assignRoute: (MyRoutes) -> Void
    
    public init(route: MyRoutes, assignRoute: @escaping (MyRoutes) -> Void) {
        self.route = route
        self.assignRoute = assignRoute
    }
    
//    MyRoute
    public func go(to route: MyRoutes) {
        self.route = route
        assignRoute(route)
        SailboatGlobal.manager.update()
    }
}
