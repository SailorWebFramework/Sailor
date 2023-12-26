//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/26/23.
//

import Foundation


public protocol App: Page {
    init()
}

extension App {
    public static func main() {
        SailorGlobal.build(root: Self().body)
    }
}
