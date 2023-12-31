//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/26/23.
//

import Foundation

public protocol App: Page {
    static func main()

    init()
    
}

extension App {
    public static func main() {
//        SailboatGlobal.shared = DefaultManager()
        SailboatGlobal.initialize(DefaultManager())
        SailboatGlobal.shared.build(page: Self())
    }
}
