//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/30/23.
//

import Sailboat
import SailorShared
import JavaScriptKit

#if os(WASI)
import SailorWeb
#endif

// TODO: remove App and only use Website for web apps to avoid SwiftUI collisions
// TODO: Later maybe create App if SwiftUI-like Syntax is ever adopted for cross-platform / native apps
public protocol Website: Page {
    static func main()
    
    var body: Body { get }
    
    var head: Head { get }

    init()
}

#if os(WASI)

extension Website {
    public static func main() {
        SailboatGlobal.initialize(SailorWebManager())
        
        let bodyElement = Self().body
        let headElement = Self().head

        SailorGlobal.initialize(head: headElement)
        SailboatGlobal.manager.build(page: bodyElement)
        
        print("BODY:", bodyElement.description)
        
        // runs the onAppear event for the Body
        // TODO: FIX THIS I REMOVED IT FOR TEST
//        if let bodyRenderer = bodyElement.renderer as? JSNode {
//            bodyRenderer.enterEvents()
//        }
    }
}

#else

extension Website {
    public static func main() {
        fatalError("To conform to Website your project must build to WASI")
    }
}

#endif
