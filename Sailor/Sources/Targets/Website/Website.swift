//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/30/23.
//

import Sailboat

// TODO: remove App and only use Website for web apps to avoid SwiftUI collisions
// TODO: Later maybe create App if SwiftUI-like Syntax is ever adopted for cross-platform / native apps
public protocol Website {
    static func main()
    var router : Router { get }
    
    // associatedtype AppBody: Page
    // var body: AppBody { get }
    var config: Config { get }
    
    init()
}

extension Website {
    public static func main() {
        SailboatGlobal.initialize(SailorManager())
        SailboatGlobal.shared.build(page: Self().config.root)
        print("HEEEEREREERER")
        // print(JSNode.window.location.hash.object.string)
    }
    func handleRouteChange(route: String) {
        // Update UI based on the route change
        print("Route changed to: \(route)")
    }

    func goToSomePage() {
        router.navigateTo(route: "/some-page")
    }
}
