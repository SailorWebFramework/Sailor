//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/30/23.
//

import Sailboat

// TODO: remove App and only use Website for web apps to avoid SwiftUI collisions
// TODO: Later maybe create App if SwiftUI-like Syntax is ever adopted for cross-platform / native apps
protocol Website: App {
    static func main()
    
    associatedtype AppBody: Page
    var body: AppBody { get }
    
    init()
}

extension Website {
    public static func main() {
        SailboatGlobal.initialize(SailorManager())
        SailboatGlobal.shared.build(app: Self())
    }
}
