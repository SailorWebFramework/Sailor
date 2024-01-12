//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/26/23.
//

import Sailboat

public protocol App {
    static func main()
    
    associatedtype AppBody: Page
    var body: AppBody { get }
    
    init()
    
}

extension App {
    public static func main() {
        SailboatGlobal.initialize(DefaultManager())
        SailboatGlobal.shared.build(page: Self().body)
    }
}
