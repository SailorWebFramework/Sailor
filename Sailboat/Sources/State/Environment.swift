//
//  File.swift
//  
//
//  Created by Joshua Davis on 10/8/23.
//

// TODO: dictionary use thing so   @Environment(\.myCustomSetting) var mySetting works?
// TODO: somehow pass it down
public protocol Routes: CustomStringConvertible {
    static var getRoot: Self { get }
    
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

public protocol SomeEnvironment {
    associatedtype EnvRoutes: Routes
    var navigation: Navigation<EnvRoutes> { get set }
}

@propertyWrapper
public class Environment<MyEnvironment: SomeEnvironment, Value> {
    
    var get: Value {
        // TODO: check this is force casting
        guard let keyPath = self.keyPath else { fatalError("todo: allow for env when no keypath given") }
        
        return (SailboatGlobal.manager.environment as! MyEnvironment)[keyPath: keyPath]
    }
    
    let set: (Value) -> Void = { newValue in

    }
    
    var keyPath: KeyPath<MyEnvironment, Value>?

    public var wrappedValue: Value {
        get { get }
        set { set(newValue) }
    }
    
//    public init() {
//        self.keyPath = nil
//    }
    
    public init(_ keyPath: KeyPath<MyEnvironment, Value>) {
        self.keyPath = keyPath
    }
    
}
