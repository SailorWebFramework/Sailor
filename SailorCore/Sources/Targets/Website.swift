//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/30/23.
//

import Sailboat

#if os(WASI)

// Code specific to WASI platform
import SailorWeb

// TODO: remove App and only use Website for web apps to avoid SwiftUI collisions
// TODO: Later maybe create App if SwiftUI-like Syntax is ever adopted for cross-platform / native apps
public protocol Website: Page {
    static func main()
    
//    associatedtype WebRoutes: Routes
    associatedtype AppBody: Page
    var body: AppBody { get }
    
    
    init()
}

extension Website {
    
    public static func main() {
        SailboatGlobal.initialize(SailorWebManager())
        let body = Self().body
        
        if body is Body {
            SailboatGlobal.manager.build(page: body)
        } else {
            SailboatGlobal.manager.build(page: Body { body })
        }
    }
}

#else

public protocol Website: Page {
    static func main()
    
    associatedtype AppBody: Page
    var body: AppBody { get }
    
    init()
}

extension Website {
    public static func main() {
        fatalError("To conform to Website your project must build to WASI")
    }
}

#endif
