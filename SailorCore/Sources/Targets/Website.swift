//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/30/23.
//

import Sailboat
import SailorShared

#if os(WASI)
import SailorWeb
#endif

// TODO: remove App and only use Website for web apps to avoid SwiftUI collisions
// TODO: Later maybe create App if SwiftUI-like Syntax is ever adopted for cross-platform / native apps
public protocol Website: Page {
    static func main()
    
    associatedtype AppBody: Page
    var body: AppBody { get }
    
    init()
}

#if os(WASI)

extension Website {
    
    public static func main() {
        SailboatGlobal.initialize(SailorWebManager())
        let pageBody = Self().body
        let bodyElement: any Element = if let body = pageBody as? Body {
            body
        } else {
            Body { pageBody }
        }
        
        SailboatGlobal.manager.build(page: bodyElement)
        
        // runs the onAppear event for the Body
        if let bodyRenderer = bodyElement.renderer as? JSNode {
            bodyRenderer.sailorEvents.onAppear(.none)
        }

    }
}

#else

extension Website {
    public static func main() {
        fatalError("To conform to Website your project must build to WASI")
    }
}

#endif
