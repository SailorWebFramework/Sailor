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
    
    associatedtype Body: SailorCore.Body
    associatedtype Head: SailorCore.Head

    var body: Body { get }
    var head: Head { get }

    init()
}

#if os(WASI)

extension Website {
    public static func main() {
        SailboatGlobal.initialize(SailorWebManager())
        
        JSNode.installGlobalExecutor()
        
        let bodyElement = Self().body
        let headElement = Self().head

        SailorGlobal.initialize(head: headElement)
        SailboatGlobal.manager.build(page: bodyElement)
                
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
