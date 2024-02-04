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
    var config: Config { get }
    // associatedtype AppBody: Page
    // var body: AppBody { get }
    
    
    init()
}

extension Website {
    public static func main() {
        let url = JSNode.window.location.object!.href.string!
        let cleaned = Self().router.cleanPath(path: url)
        print("cleaned URL: ", cleaned)
        let page = Self().config.getRoute(path: cleaned)
        SailboatGlobal.initialize(SailorManager())
        SailboatGlobal.shared.build(page: page)
    }
}
