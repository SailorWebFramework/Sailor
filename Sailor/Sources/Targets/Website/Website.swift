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
//    var router : Router { get }
//    var config: Config { get }
    
    var env: Environment { get }
    
    associatedtype AppBody: Page
    var body: AppBody { get }
    
    init()
}

extension Website {
    
    public static func main() {
        let website = Self()
        let url = JSNode.window.location.object!.href.string!
        let cleaned = Router.cleanPath(path: url)
        print("cleaned URL: ", cleaned)
//        let page = website.config.getRoute(path: cleaned)
        
        SailboatGlobal.initialize(SailorManager())
        SailboatGlobal.manager.build(page: website.body)
    }
}
