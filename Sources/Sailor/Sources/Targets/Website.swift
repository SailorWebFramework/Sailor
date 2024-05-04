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

public protocol Website: Page {
    static func main()
    
    associatedtype Body: Sailor.Body
    associatedtype Head: Sailor.Head

    var body: Body { get }
    var head: Head { get }

    init()
}

#if os(WASI)

extension Website {
    public static func main() {
        JSNode.installGlobalExecutor()
        
        SailboatGlobal.initialize(SailorWebManager())

        let mainPage = Self()
        let bodyElement = mainPage.body
        let headElement = mainPage.head

        SailboatGlobal.initialize(body: bodyElement)
        SailorGlobal.initialize(head: headElement)
        
        // runs the onAppear event for the Body and Head
        if let bodyRenderer = bodyElement.renderer as? JSNode {
            bodyRenderer.shallowEnterEvents()
        }
        
        if let headRenderer = headElement.renderer as? JSNode {
            headRenderer.shallowEnterEvents()
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
